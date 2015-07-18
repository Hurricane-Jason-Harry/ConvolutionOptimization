#ifndef MATRIX_OPTIMIZATION_H
#define MATRIX_OPTIMIZATION_H

#include <stdint.h>

int compare_matrix(const uint64_t* sample, const uint64_t* reference);

void matconv_optimize(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_naive(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_omp(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_simd(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_cb(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_lu(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_rb(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_omp_simd(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_omp_simd_lu(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

void matconv_omp_simd_lu_rb(uint64_t* newimg,
		const uint16_t* filter, const uint16_t* image);

#endif
