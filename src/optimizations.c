#include <stdint.h>
#include <string.h>

#include "config.h"
#include "optimizations.h"

#ifdef __AVX2__
#include "optimizations_x86.c"
#elif defined __riscv
#include "optimizations_riscv.c"
#endif

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
                    newimg[i*WIMAGE+j] += scalarFil*image[OFFSET+i*WIMAGE-k*WIMAGE+j-l];
                }
            }
		}
	}
}


