#include <stdio.h>
#include <assert.h>

typedef unsigned int Word;

#define WORD_SIZE 32

Word reverseBits(Word w) {
    Word ret = 0;

    for (unsigned int bit = 0; bit < WORD_SIZE; bit++) {
        Word mask = 1u << (WORD_SIZE - 1 - bit);
        Word reverseMask = 1u << bit;

        if (w & mask) {
            ret |= reverseMask;
        }
    }
    
    
    return ret;
}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E
    assert(reverseBits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}