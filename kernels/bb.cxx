// CHORD 8-bit baseband beamformer
// See <https://www.overleaf.com/project/6228adae742a3a2da1afe437>

// $ make format && make bb && ./bb

#include <array>
#include <cassert>
#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <random>
#include <vector>

// Kernel parameters

constexpr int T = 32768; // 32768; // number of times
constexpr int B = 96;    // number of beams
constexpr int D = 512;   // number of dishes
constexpr int F = 16;    // frequency channels per GPU

using int4x2_t = uint8_t;

constexpr int4x2_t set4(const int8_t lo, const int8_t hi) {
  return (uint8_t(lo) & 0x0f) | ((uint8_t(hi) << 4) & 0xf0);
}

constexpr std::array<int8_t, 2> get4(const int4x2_t i) {
  return {int8_t(int8_t((i + 0x08) & 0x0f) - 0x08),
          int8_t(int8_t(((i >> 4) + 0x08) & 0x0f) - 0x08)};
}

constexpr bool test_get4_set4() {
  for (int hi = -8; hi <= 7; ++hi) {
    for (int lo = -8; lo <= 7; ++lo) {
      if (get4(set4(lo, hi))[0] != lo)
        return false;
      if (get4(set4(lo, hi))[1] != hi)
        return false;
    }
  }
  return true;
}

static_assert(test_get4_set4());

void bb_simple(const int8_t *__restrict__ const A,
               const int4x2_t *__restrict__ const E,
               const int8_t *__restrict__ const s,
               int4x2_t *__restrict__ const J) {
  // J[t,p,f,b] = Σ[d] A[d,b,p,f] E[d,p,f,t]
#pragma omp parallel for collapse(2)
  for (int f = 0; f < F; ++f) {
    for (int p = 0; p < 2; ++p) {
      for (int t = 0; t < T; ++t) {
        for (int b = 0; b < B; ++b) {
          int Jre = 0, Jim = 0;
          // This pragma slows things down tenfold
          // #pragma omp simd
          for (int d = 0; d < D; ++d) {
            const int Are = A[(((f * 2 * p) * B + b) * D + d) * 2 + 0];
            const int Aim = A[(((f * 2 * p) * B + b) * D + d) * 2 + 1];
            const auto [Ere, Eim] = get4(E[((t * F + f) * 2 + p) * D + d]);
            Jre += Are * Ere - Aim * Eim;
            Jim += Are * Eim + Aim * Ere;
          }
          Jre >>= s[(f * 2 + p) * B + b];
          Jim >>= s[(f * 2 + p) * B + b];
          J[((b * F + f) * 2 + p) * T + t] = set4(Jre, Jim);
        }
      }
    }
  }
}

int main(int argc, char **argv) {
  std::cout << "CHORD 8-bit baseband beamformer\n";
  using std::abs;
  std::random_device rd;
  std::default_random_engine re(rd());
  for (int iter = 0; iter < 100; ++iter) {
    std::cout << "Initializing inputs...\n";
    std::vector<int8_t> A(F * 2 * B * D * 2, 0);
    std::vector<int4x2_t> E(T * F * 2 * D, 0);
    std::vector<int4x2_t> J(B * F * 2 * T, 0);
    std::vector<int8_t> s(F * 2 * B, 0);
    const int f1 = std::uniform_int_distribution<int>(0, F - 1)(re);
    const int p1 = std::uniform_int_distribution<int>(0, 1)(re);
    const int t1 = std::uniform_int_distribution<int>(0, T - 1)(re);
    const int b1 = std::uniform_int_distribution<int>(0, B - 1)(re);
    const int d1 = std::uniform_int_distribution<int>(0, D - 1)(re);
    int Are1, Aim1, Ere1, Eim1, Jre1, Jim1;
    do {
      Are1 = std::uniform_int_distribution<int>(-7, 7)(re);
      Aim1 = std::uniform_int_distribution<int>(-7, 7)(re);
      Ere1 = std::uniform_int_distribution<int>(-7, 7)(re);
      Eim1 = std::uniform_int_distribution<int>(-7, 7)(re);
      Jre1 = Are1 * Ere1 - Aim1 * Eim1;
      Jim1 = Are1 * Eim1 + Aim1 * Ere1;
    } while (!(abs(Jre1) <= 7 && abs(Jim1) <= 7));
    A[(((f1 * 2 * p1) * B + b1) * D + d1) * 2 + 0] = Are1;
    A[(((f1 * 2 * p1) * B + b1) * D + d1) * 2 + 1] = Aim1;
    E[((t1 * F + f1) * 2 + p1) * D + d1] = set4(Ere1, Eim1);
    std::cout << "Forming beams...\n";
    const auto time0 = std::chrono::high_resolution_clock::now();
    bb_simple(A.data(), E.data(), s.data(), J.data());
    const auto time1 = std::chrono::high_resolution_clock::now();
    const auto elapsed_us =
        std::chrono::duration_cast<std::chrono::microseconds>(time1 - time0)
            .count();
    std::cout << "  Elapsed time: " << elapsed_us / 1.0e+6 << " s\n";
    std::cout << "Checking output...\n";
    for (int f = 0; f < F; ++f) {
      for (int p = 0; p < 2; ++p) {
        for (int t = 0; t < T; ++t) {
          for (int b = 0; b < B; ++b) {
            const auto [Jre, Jim] = get4(J[((b * F + f) * 2 + p) * T + t]);
            if (f == f1 && p == p1 && t == t1 && b == b1)
              assert(Jre == Jre1 && Jim == Jim1);
            else
              assert(Jre == 0 && Jim == 0);
          }
        }
      }
    }
  }
  std::cout << "Done.\n";
  return 0;
}
