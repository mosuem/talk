#ifndef FORMATLIB_H
#define FORMATLIB_H

#include <stdbool.h>

char *format(double number, bool isPercentage);
char *formatDate(int timestamp);

#endif