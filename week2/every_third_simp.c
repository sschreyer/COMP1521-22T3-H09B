// Print every third number from 24 to 42.
#include <stdio.h>

int main(void) {
    int x = 24; 

count3_loop_cond:
    // check the loop condition
    if (x >= 42) goto count3_loop_end;
    
    printf("%d\n", x);
    x += 3;

    goto count3_loop_cond;
    
count3_loop_end:

    return 0;
}