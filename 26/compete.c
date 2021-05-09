#include "bootpack.h"
#include "compete.h"

void api_wait(int S);
void api_signal(int S);
void api_putstr0(char *s);
void api_end(void);



void HariMain(void)
{
    int a = common;
    a++;
    char s[60];
	sprintf(s, "Compete! %d", a);
    api_putstr0(s);
    api_end();
}