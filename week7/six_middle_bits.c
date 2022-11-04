#include <stdio.h>
#include <stdint.h>

#define _32_BIT_UINT_SIZE 32

uint32_t six_middle_bits(uint32_t u) {
    return (u >> 13) & 0x3f;
}

void print_bits(uint32_t u) {
    for (int i = 0; i < _32_BIT_UINT_SIZE; i++) {
        printf("%d", 1 & (u >> (_32_BIT_UINT_SIZE - 1 - i)));
    }
    printf("\n");
}


int main(void) {

    uint32_t u = 0xF00DA00F;
    print_bits(u);
    uint32_t only_middle_six = six_middle_bits(u);
    print_bits(only_middle_six);
    printf("%04x\n", only_middle_six);

    return 0; 
}