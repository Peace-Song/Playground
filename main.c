#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(){
    int arr[5] = {2, 3, 5, 7, 11};

    printf("arr[1] == %d\n", arr[1]);
    printf("*(arr + 1) == %d\n", *(arr + 1));

    return 0;
}

        
