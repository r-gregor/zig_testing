#include <stdio.h>

int main(void) {
	unsigned long long sum = 0;

	for (size_t i = 0; i < 1000000000; i++) {
		sum += i;
	}
	printf("Sum: %ld\n", sum);

	return 0;
}

