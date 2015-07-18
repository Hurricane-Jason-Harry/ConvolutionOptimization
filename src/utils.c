#include <stdlib.h>
#include <stdio.h>
#include "config.h"
#include <math.h>
#include <stdint.h>

/*
 * Compare two matrices. Return 0 if they are the same, 1 otherwise.
 */
int compare_matrix(const uint64_t* sample, const uint64_t* reference) {
	for (int i = 0; i < HIMAGE*WIMAGE; i++) {
		if (sample[i] != reference[i]) {
			printf("difference at pos %d sample value: %lu \n"
				   "reference value: %lu difference: %ld\n", i, sample[i], reference[i],
				   (int64_t)(((int64_t)sample[i])-((int64_t)reference[i])));
			return 1;
		}
	}
	return 0;
}

int read_matrix_dimension(const char* filename, int* wfilter, int* hfilter,
		int* wimage, int* himage) {
	FILE* file = fopen(filename, "rb");
	if (!file) return 1;
	if (!fread(wfilter, sizeof(int), 1, file)) return 2;
	if (!fread(hfilter, sizeof(int), 1, file)) return 2;
	if (!fread(wimage, sizeof(int), 1, file)) return 2;
	if (!fread(himage, sizeof(int), 1, file)) return 2;
	if (fclose(file)) return 3;
	return 0;
}

int read_matrix(const char* filename, uint64_t* newimg, uint16_t* filter, uint16_t* image) {
	FILE* file = fopen(filename, "rb");
	fseek(file, 4*sizeof(int), SEEK_SET);
	if (!file) return 1;
	if (fread(newimg, sizeof(uint64_t), WIMAGE*HIMAGE, file) < WIMAGE*HIMAGE) return 2;
	if (fread(filter, sizeof(uint16_t), WFILTER*HFILTER, file) < WFILTER*HFILTER) return 2;
	if (fread(image, sizeof(uint16_t), WIMAGE*HIMAGE, file) < WIMAGE*HIMAGE) return 2;
	if (fclose(file)) return 3;
	return 0;
}
