#ifndef MATRIX_CONFIG_H
#define MATRIX_CONFIG_H

#define PAD_ZERO (8*1024)

#define WFILTER 7
#define HFILTER 7

#define WIMAGE 1024
#define HIMAGE 1024

#define X86_VECTOR_LENGTH 4

#define OFFSET (((HFILTER-1)/2)*WIMAGE+(HFILTER-1)/2)

#define TEST_FILENAME "test/test.out"

#endif
