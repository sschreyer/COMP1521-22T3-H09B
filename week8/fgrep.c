// Print lines containing  specified substring from the files specified as arguments

#include <stdio.h>
#include <string.h>

#define MAX_LINE 65536

void search_stream(FILE *stream, char stream_name[], char search_for[]);

int main(int argc, char *argv[]) {

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <prefix> <files>\n", argv[0]);
        return 1;
    } if (argc == 2) {
        search_stream(stdin, "<stdin>", argv[1]);
    } else {
        
        for (int i = 2; i < argc; i++) {
            FILE *f = fopen(argv[i], "r");
            if (f == NULL) {
                perror(argv[i]);
                return 1;
            }
            search_stream(f, argv[i], argv[1]);
            fclose(f);
        }

    }

    return 0;
}

void search_stream(FILE *stream, char stream_name[], char search_for[]) {
    char buffer[MAX_LINE];

    int line_num = 0;
    while (fgets(buffer, MAX_LINE, stream) != NULL) {
        if (strstr(buffer, search_for) != NULL) {
            fprintf(stdout, "%d: ", line_num);
            fprintf(stdout, "%s", buffer);
        }
        line_num++;
    }
}