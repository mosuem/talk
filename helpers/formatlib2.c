#include "formatlib2.h"
#include <stdio.h>
#include <stdlib.h>

char *formatDate(int timestamp){
    char *result = malloc(sizeof(char) * 20); // Allocate enough space
    if (result == NULL) {
        return NULL; // Handle memory allocation failure
    }

    sprintf(result, "%.2d%%", timestamp * 100); // Format as percentage (e.g., 35.43%)

    return result;
}
