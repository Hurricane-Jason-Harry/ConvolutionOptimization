#ifndef MATRIX_UTILS_H
#define MATRIX_UTILS_H

#include <stdint.h>
#include <sys/time.h>

int compare_matrix(const uint64_t* sample, const uint64_t* reference);

int read_matrix_dimension(const char* filename, int* wfilter, int* hfilter,
		int* wimage, int* himage);

int read_matrix(const char* filename, uint64_t* newimg, uint16_t* filter, uint16_t* image);

/* Return the current system time in micro seconds */
inline static uint64_t timestamp_us()
{
	struct timeval tv;
	gettimeofday(&tv, 0);
	return 1000000L * tv.tv_sec + tv.tv_usec;
}

#endif
