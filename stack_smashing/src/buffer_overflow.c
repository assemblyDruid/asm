#include <string.h>

void function(char* str)
{
    char buffer[16];
    strcpy(buffer, str);
}

void main(int argc, char** argv)
{
    char large_string[256];

    int ii;
    for (ii = 0; ii < 255; ii++)
    {
        large_string[ii] = 'A';
    }

    function(large_string);
}
