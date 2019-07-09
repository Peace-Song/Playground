#include <stdio.h>


void pswap(int** p1, int** p2);

int main(){
    int a = 10, b = 20;
    int *pa;
    int *pb;
    pa = &b;
    pb = &a;
    
    int **ppa = &pa;
    int **ppb = &pb;
    
    printf("pa == %ld\n", (long int)pa);
    printf("pb == %ld\n", (long int)pb);

    pswap(ppa, ppb);

    printf("pa == %ld\n", (long int)pa);
    printf("pb == %ld\n", (long int)pb);

    return 0;
}

void pswap(int** p1, int** p2){
    int* temp;
    temp = *p1;
    *p1 = *p2;
    *p2 = temp;
}

        
