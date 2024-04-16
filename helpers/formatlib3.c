#include "formatlib.h"
#include <stdio.h>
#include <stdlib.h>

char *format(double number, bool isPercentage) {
    char *result = malloc(sizeof(char) * 20); // Allocate enough space
    if (result == NULL) {
        return NULL; // Handle memory allocation failure
    }

    if (isPercentage) {
        sprintf(result, "%.2f%%", number * 100); // Format as percentage (e.g., 35.43%)
    } else {
        sprintf(result, "%.2f", number); // Format as a regular number
    }

    return result;
}

char *formatDate(int timestamp){
    char *result = malloc(sizeof(char) * 20); // Allocate enough space
    if (result == NULL) {
        return NULL; // Handle memory allocation failure
    }

    sprintf(result, "%.2d%%", timestamp * 100); // Format as percentage (e.g., 35.43%)

    return result;
}
