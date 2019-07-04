#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(){
    srand((unsigned)time(NULL));
    printf("Current timestamp is: %d\n", (unsigned)time(NULL));
    printf("Random integer is: %d\n", rand());

    return 0;
}

        
