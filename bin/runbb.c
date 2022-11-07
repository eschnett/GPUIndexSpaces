// $ nvcc -o runbb runbb.c -lnvptxcompiler_static

#include <nvPTXCompiler.h>

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  printf("runbb\n");

  // Read PTX code
  printf("Reading PTX code...\n");
  FILE *const ptxfile = fopen("../output/bb1.ptx", "r");
  assert(ptxfile);
  fseek(ptxfile, 0, SEEK_END);
  const size_t ptxsize = ftell(ptxfile);
  printf("  PTX size: %zd bytes\n", ptxsize);
  fseek(ptxfile, 0, SEEK_SET);
  void *const ptxcode = malloc(ptxsize);
  const size_t items_read = fread(ptxcode, 1, ptxsize, ptxfile);
  assert(items_read == ptxsize);
  fclose(ptxfile);

  // Compile PTX code
  printf("Compiling PTX code...\n");
  nvPTXCompilerHandle compiler;
  nvPTXCompileResult res = nvPTXCompilerCreate(&compiler, ptxsize, ptxcode);
  assert(res == NVPTXCOMPILE_SUCCESS);
  const char *const options[] = {// "--extensible-whole-program",
                                 "--gpu-name=sm_86", "--verbose"};
  const size_t num_options = sizeof options / sizeof *options;
  res = nvPTXCompilerCompile(compiler, num_options, options);
  // assert(res == NVPTXCOMPILE_SUCCESS);

  // Show info messages
  size_t info_log_size;
  res = nvPTXCompilerGetInfoLogSize(compiler, &info_log_size);
  char *const info_log = malloc(info_log_size);
  res = nvPTXCompilerGetInfoLog(compiler, info_log);
  printf("%s", info_log);
  free(info_log);

  // Show errors
  size_t error_log_size;
  res = nvPTXCompilerGetErrorLogSize(compiler, &error_log_size);
  char *const error_log = malloc(error_log_size);
  res = nvPTXCompilerGetErrorLog(compiler, error_log);
  printf("%s", error_log);
  free(error_log);

  // We can run the code here

  // Done.
  printf("Done.\n");
  return 0;
}
