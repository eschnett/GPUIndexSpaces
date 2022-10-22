CXX = g++
CXXFLAGS = -O3 -Wall -fopenmp -g -march=native -std=c++17
all: bb
bb: bb.o
	$(CXX) $(CXXFLAGS) -o $@ $^
%.o: %.cxx
	$(CXX) $(CXXFLAGS) -c $*.cxx
format:
	clang-format -i bb.cxx
clean:
	$(RM) bb bb.o
.PHONY: all format clean
