#include <stdio.h>
#include <immintrin.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "config.h"
#include "optimizations.h"
#include "boost.h"

void matconv_optimize(uint64_t* newimg, const uint16_t* filter, const uint16_t* image) {
	#ifdef MATCONV_NAIVE
		matconv_naive(newimg, filter, image);
	#elif defined (MATCONV_OMP)
		matconv_omp(newimg, filter, image);
	#elif defined (MATCONV_SIMD)
		matconv_simd(newimg, filter, image);
	#elif defined (MATCONV_CB)
		matconv_cb(newimg, filter, image);
	#elif defined (MATCONV_LU)
		matconv_lu(newimg, filter, image);
	#elif defined (MATCONV_RB)
		matconv_rb(newimg, filter, image);
	#elif defined (MATCONV_OMP_SIMD)
		matconv_omp_simd(newimg, filter, image);
	#elif defined (MATCONV_OMP_SIMD_LU)
		matconv_omp_simd_lu(newimg, filter, image);
	#elif defined (MATCONV_OMP_SIMD_LU_RB)
		matconv_omp_simd_lu_rb(newimg, filter, image);
	#endif
}

void matconv_naive(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {
	memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
	for (int i = 0; i < WIMAGE; i++)
	{
		for (int k = 0; k < WFILTER; k++)
		{
            for (int l = 0; l < HFILTER; l++)
            {
                uint64_t scalarFil = filter[k*WFILTER+l];
                for (int j = 0; j < HIMAGE; j++)
                {
                    newimg[i*WIMAGE+j] += scalarFil*image[i*WIMAGE-k*WIMAGE+j-l];
                }
            }
		}
	}
}

void matconv_omp(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {
	memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
	#pragma omp parallel for
	for (int i = 0; i < WIMAGE; i++)
	{
		for (int k = 0; k < WFILTER; k++)
		{
            for (int l = 0; l < HFILTER; l++)
            {
                uint64_t scalarFil = filter[k*WFILTER+l];
                for (int j = 0; j < HIMAGE; j++)
                {
                    newimg[i*WIMAGE+j] += scalarFil*image[i*WIMAGE-k*WIMAGE+j-l];
                }
            }
		}
	}
}

void matconv_simd(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict img) {
	memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
	for (int i = 0; i < WIMAGE; i++)
	{
		for (int k = 0; k < WFILTER; k++)
		{
            for (int l = 0; l < HFILTER; l++)
            {
                __m256i scalarFil = _mm256_set1_epi32(((uint32_t)(filter[k*WFILTER+l])));
                for (int j = 0; j < HIMAGE; j+=X86_VECTOR_LENGTH)
                {
                	__m256i vecNew = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j));
                	__m256i vecImg = _mm256_loadu_si256((__m256i*)(img+i*WIMAGE-k*WIMAGE+j-l));
                	vecImg = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 0));
                	vecImg = _mm256_mullo_epi32(scalarFil, vecImg);
                	vecNew = _mm256_add_epi64(vecNew, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg, 0)));
                	_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j), vecNew);
                }
            }
		}
	}
}


void matconv_cb(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {
	memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
	const int CACHE_BLOCK = 512;
	for (int jj = 0; jj < WIMAGE; jj+=CACHE_BLOCK) {
		for (int i = 0; i < WIMAGE; i++)
		{
			for (int k = 0; k < WFILTER; k++)
			{
	            for (int l = 0; l < HFILTER; l++)
	            {
	                uint64_t scalarFil = filter[k*WFILTER+l];
	                for (int j = jj; j < jj+CACHE_BLOCK; j++)
	                {
	                    newimg[i*WIMAGE+j] += scalarFil*image[i*WIMAGE-k*WIMAGE+j-l];
	                }
	            }
			}
		}
	}
}


void matconv_lu(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {

	#define UNROLL_COUNT 32

	memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
	for (int i = 0; i < WIMAGE; i++)
	{
		for (int k = 0; k < WFILTER; k++)
		{
            for (int l = 0; l < HFILTER; l++)
            {
                uint64_t scalarFil = filter[k*WFILTER+l];
                for (int j = 0; j < HIMAGE; j+=UNROLL_COUNT)
                {

					#define CODE(n) newimg[i*WIMAGE+j+n] += scalarFil*\
										image[i*WIMAGE-k*WIMAGE-l+j+n];
                	UNROLL(CODE, UNROLL_COUNT)

					#undef CODE
                }
            }
		}
	}
	#undef UNROLL_COUNT
}

void matconv_rb(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {

	memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
	for (int i = 0; i < WIMAGE; i++)
	{
		for (int k = 0; k < WFILTER; k++)
		{
			uint64_t fil0 = filter[k*WFILTER+0];
			uint64_t fil1 = filter[k*WFILTER+1];
			uint64_t fil2 = filter[k*WFILTER+2];
			uint64_t fil3 = filter[k*WFILTER+3];
			uint64_t fil4 = filter[k*WFILTER+4];
			uint64_t fil5 = filter[k*WFILTER+5];
			uint64_t fil6 = filter[k*WFILTER+6];

			for (int j = 0; j < HIMAGE; j+=4)
			{
				uint64_t img_6 = image[i*WIMAGE-k*WIMAGE+j-6];
				uint64_t img_5 = image[i*WIMAGE-k*WIMAGE+j-5];
				uint64_t img_4 = image[i*WIMAGE-k*WIMAGE+j-4];
				uint64_t img_3 = image[i*WIMAGE-k*WIMAGE+j-3];
				uint64_t img_2 = image[i*WIMAGE-k*WIMAGE+j-2];
				uint64_t img_1 = image[i*WIMAGE-k*WIMAGE+j-1];
				uint64_t img0  = image[i*WIMAGE-k*WIMAGE+j+0];
				uint64_t img1  = image[i*WIMAGE-k*WIMAGE+j+1];
				uint64_t img2  = image[i*WIMAGE-k*WIMAGE+j+2];
				uint64_t img3  = image[i*WIMAGE-k*WIMAGE+j+3];

				newimg[i*WIMAGE+j]   += fil0*img0 + fil1*img_1 + fil2*img_2 + fil3*img_3 + fil4*img_4 + fil5*img_5 + fil6*img_6;
				newimg[i*WIMAGE+j+1] += fil0*img1 + fil1*img0  + fil2*img_1 + fil3*img_2 + fil4*img_3 + fil5*img_4 + fil6*img_5;
				newimg[i*WIMAGE+j+2] += fil0*img2 + fil1*img1  + fil2*img0  + fil3*img_1 + fil4*img_2 + fil5*img_3 + fil6*img_4;
				newimg[i*WIMAGE+j+3] += fil0*img3 + fil1*img2  + fil2*img1  + fil3*img0  + fil4*img_1 + fil5*img_2 + fil6*img_3;
			}
		}
	}
}


void matconv_omp_simd(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {
    memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
    #pragma omp parallel for
    for (int i = 0; i < WIMAGE; i++)
    {
        for (int k = 0; k < WFILTER; k++)
        {
            for (int l = 0; l < HFILTER; l++)
            {
                __m256i scalarFil = _mm256_set1_epi32(((uint32_t)(filter[k*WFILTER+l])));
                for (int j = 0; j < HIMAGE; j+=X86_VECTOR_LENGTH)
                {
                	__m256i vecNew = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j));
                	__m256i vecImg = _mm256_loadu_si256((__m256i*)(image+i*WIMAGE-k*WIMAGE+j-l));
                	vecImg = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 0));
                	vecImg = _mm256_mullo_epi32(scalarFil, vecImg);
                	vecNew = _mm256_add_epi64(vecNew, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg, 0)));
                	_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j), vecNew);
                }
            }
        }
    }
}


void matconv_omp_simd_lu(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {
    memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
	#define UNROLL_COUNT 2
    #pragma omp parallel for
    for (int i = 0; i < WIMAGE; i++)
    {
        for (int k = 0; k < WFILTER; k++)
        {
            for (int l = 0; l < HFILTER; l++)
            {
                __m256i scalarFil = _mm256_set1_epi32(((uint32_t)(filter[k*WFILTER+l])));
                for (int j = 0; j < HIMAGE; j+=16*UNROLL_COUNT)
                {
                	__m256i vecNew0, vecNew1, vecNew2, vecNew3, vecImg, vecImg0, vecImg1;
					#define CODE(n) \
						vecNew0 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+16*n));\
						vecNew1 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+4+16*n));\
						vecNew2 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+8+16*n));\
						vecNew3 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+12+16*n));\
						vecImg  = _mm256_loadu_si256((__m256i*)(image+i*WIMAGE-k*WIMAGE+j-l+16*n));\
						vecImg0 = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 0));\
						vecImg1 = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 1));\
						vecImg0 = _mm256_mullo_epi32(scalarFil, vecImg0);\
						vecImg1 = _mm256_mullo_epi32(scalarFil, vecImg1);\
						vecNew0 = _mm256_add_epi64(vecNew0, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg0, 0)));\
						vecNew1 = _mm256_add_epi64(vecNew1, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg0, 1)));\
						vecNew2 = _mm256_add_epi64(vecNew2, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg1, 0)));\
						vecNew3 = _mm256_add_epi64(vecNew3, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg1, 1)));\
						_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+16*n), vecNew0);\
						_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+4+16*n), vecNew1);\
						_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+8+16*n), vecNew2);\
						_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+12+16*n), vecNew3);

					UNROLL(CODE, 2)
                }
            }
        }
    }
	#undef UNROLL_COUNT
}


void matconv_omp_simd_lu_rb(uint64_t* restrict newimg,
		const uint16_t* restrict filter, const uint16_t* restrict image) {

    memset(newimg, 0, WIMAGE*HIMAGE*sizeof(uint64_t));
    #pragma omp parallel for
    for (int i = 0; i < WIMAGE; i++)
    {
        for (int k = 0; k < WFILTER; k++)
        {
			#define CODE1(n) \
				__m256i scalarFil##n = _mm256_set1_epi32(((uint32_t)(filter[k*WFILTER+n])));
        	UNROLL(CODE1, HFILTER)
			#undef CODE1

			for (int j = 0; j < HIMAGE; j+=16)
			{
				__m256i vecNew0, vecNew1, vecNew2, vecNew3, vecImg, vecImg0, vecImg1;
				vecNew0 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j));
				vecNew1 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+4));
				vecNew2 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+8));
				vecNew3 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+12));
				#define CODE2(n)\
					vecImg = _mm256_loadu_si256((__m256i*)(image+i*WIMAGE-k*WIMAGE+j-n));\
					vecImg0 = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 0));\
					vecImg1 = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 1));\
					vecImg0 = _mm256_mullo_epi32(scalarFil##n, vecImg0);\
					vecImg1 = _mm256_mullo_epi32(scalarFil##n, vecImg1);\
					vecNew0 = _mm256_add_epi64(vecNew0, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg0, 0)));\
					vecNew1 = _mm256_add_epi64(vecNew1, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg0, 1)));\
					vecNew2 = _mm256_add_epi64(vecNew2, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg1, 0)));\
					vecNew3 = _mm256_add_epi64(vecNew3, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg1, 1)));\

				UNROLL(CODE2, HFILTER)
				#undef CODE2

				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j), vecNew0);
				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+4), vecNew1);
				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+8), vecNew2);
				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+12), vecNew3);


				/*
				vecNew0 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+16));
				vecNew1 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+4+16));
				vecNew2 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+8+16));
				vecNew3 = _mm256_loadu_si256((__m256i*)(newimg+i*WIMAGE+j+12+16));
				#define CODE2(n)\
					vecImg = _mm256_loadu_si256((__m256i*)(image+i*WIMAGE-k*WIMAGE+j-n+16));\
					vecImg0 = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 0));\
					vecImg1 = _mm256_cvtepu16_epi32(_mm256_extracti128_si256(vecImg, 1));\
					vecImg0 = _mm256_mullo_epi32(scalarFil##n, vecImg0);\
					vecImg1 = _mm256_mullo_epi32(scalarFil##n, vecImg1);\
					vecNew0 = _mm256_add_epi64(vecNew0, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg0, 0)));\
					vecNew1 = _mm256_add_epi64(vecNew1, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg0, 1)));\
					vecNew2 = _mm256_add_epi64(vecNew2, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg1, 0)));\
					vecNew3 = _mm256_add_epi64(vecNew3, _mm256_cvtepu32_epi64(_mm256_extracti128_si256(vecImg1, 1)));\

				UNROLL(CODE2, HFILTER)
				#undef CODE2

				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+16), vecNew0);
				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+4+16), vecNew1);
				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+8+16), vecNew2);
				_mm256_storeu_si256((__m256i*)(newimg+i*WIMAGE+j+12+16), vecNew3);*/
			}
        }
    }
}


