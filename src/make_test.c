#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>
#include <stdint.h>
#include "config.h"

void write_error() {
	fprintf(stderr, "Error while writing");
	exit(EXIT_FAILURE);
}

int main(int argc, char **argv) {

	const int wfilter = WFILTER;
	const int hfilter = HFILTER;
	const int wimage = WIMAGE;
	const int himage = HIMAGE;
	char* filename = TEST_FILENAME;

	/* allocate memory space for two input matrices and the result matrix. */
	uint64_t* newimg = calloc(wimage*himage, sizeof(uint64_t));
	uint16_t* filter = calloc(wfilter*hfilter, sizeof(uint16_t));
	uint16_t* image = calloc(wimage*himage+2*PAD_ZERO, sizeof(uint16_t));
	image += PAD_ZERO;
	srand(time(0));

	for (int i = 0; i < wfilter*hfilter; i++) {
		filter[i] = rand()%32767;
	}

	for (int i = 0; i < wimage*himage; i++) {
		image[i] = rand()%32767;
	}

	/* calculate the result matrix */
	for (int i = 0; i < wimage; i++)
	{
		for (int m = 0; m < wfilter; m++)
		{
            for (int n = 0; n < hfilter; n++)
            {
                uint64_t scalarF = filter[m*WFILTER+n];
                for (int j = 0; j < himage; j++)
                {
                    newimg[i*WIMAGE+j] += scalarF*image[(i-m)*WIMAGE+(j-n)];
                }
            }
		}
	}

	FILE* file = fopen(filename, "wb");
	if (!file) write_error();
	if (!fwrite(&wfilter, sizeof(int), 1, file)) write_error();
	if (!fwrite(&hfilter, sizeof(int), 1, file)) write_error();
	if (!fwrite(&wimage, sizeof(int), 1, file)) write_error();
	if (!fwrite(&himage, sizeof(int), 1, file)) write_error();
	if (fwrite(newimg, sizeof(uint64_t), wimage*himage, file)<wimage*himage) write_error();
	if (fwrite(filter, sizeof(uint16_t), wfilter*hfilter, file)<wfilter*hfilter) write_error();
	if (fwrite(image, sizeof(uint16_t), wimage*himage, file)<wimage*himage) write_error();
	if (fclose(file)) write_error();

	free(image-PAD_ZERO);
	free(filter);
	free(newimg);
	return EXIT_SUCCESS;
}
