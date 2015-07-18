/*
 ============================================================================
 Name        : main.c
 Author      : Jason Su and Harry He
 Version     : 1.0.0
 Copyright   : GNU
 Description : 7*7 1024*1024 2-D non-separable convolution
 ============================================================================
 */
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/time.h>
#include <time.h>
#include <immintrin.h>
#include <xmmintrin.h>

#include "config.h"
#include "optimizations.h"
#include "utils.h"

int main(int argc, char *argv[])
{
	srand (time(NULL));

	uint64_t* newimg = _mm_malloc(WIMAGE*HIMAGE*sizeof(uint64_t), 64);
	uint64_t* newimg_ref = _mm_malloc(WIMAGE*HIMAGE*sizeof(uint64_t), 64);
	uint16_t* filter = _mm_malloc(WFILTER*HFILTER*sizeof(uint16_t), 64);
	uint16_t* image = _mm_malloc((WIMAGE*HIMAGE+2*PAD_ZERO)*sizeof(uint16_t), 64);
	for (int i = 0; i < PAD_ZERO; i++) { /* PAD matrix2 with zero to ease programming the optimization functions. */
		image[i] = 0;
	}
	image += PAD_ZERO;

	int read_flag = read_matrix(TEST_FILENAME, newimg_ref, filter, image);
	if (read_flag == 1)
		printf("Cannot open test file\n");
	else if (read_flag == 2)
		printf("Error while reading data from test file");
	else if (read_flag == 3)
		printf("Error while closing the test file");
	if (read_flag)
		return 0;


	uint64_t start = timestamp_us();
	matconv_optimize(newimg, filter, image); /* run the optimization functions. */
	uint64_t time = timestamp_us() - start;

	if (compare_matrix(newimg, newimg_ref)) {
		printf("%lu incorrect\n", time);
	} else {
		printf("%lu\n", time);
	}
	_mm_free(filter);
	_mm_free(image-PAD_ZERO);
	_mm_free(newimg);
	_mm_free(newimg_ref);
	return 0;
}
