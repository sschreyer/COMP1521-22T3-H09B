// A simple program that will read 10 numbers into an array

#define N_SIZE 10

#include <stdio.h>

int main(void) {
    int i;
    int numbers[N_SIZE] = {0};

    i = 0;

scan_loop_cond:
    if (i >= N_SIZE) goto scan_loop_end;
    
    scanf("%d", &numbers[i]);
    i++;
    goto scan_loop_cond;
    

scan_loop_end:
    return 0;
}