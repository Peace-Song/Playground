#include <stdio.h>


void mulMatrix(int (*A)[3], int (*B)[4], int (*C)[4]);
void printMatrix(int (*M)[4]);

int main(){
    int A[3][3] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    int B[3][4] = { 1, 4, 7, 10, 2, 5, 8, 11, 3, 6, 9, 12 };
    int C[3][4];
    
    mulMatrix(A, B, C);
    printMatrix(C);

    return 0;
}

void mulMatrix(int (*A)[3], int (*B)[4], int (*C)[4]){
    int A_row_length = 3;
    int A_column_length = 3;
    int B_row_length = 4;
    int B_column_length = 3;

    int i, j, k;
    int vector_product;

    /*A_row_length = sizeof(A[0])/sizeof(int);
    A_column_length = sizeof(A)/(sizeof(int) * A_row_length);
    B_row_length = sizeof(B[0])/sizeof(int);
    B_column_length = sizeof(B)/(sizeof(int) * B_column_length);*/

    for(i = 0; i < A_column_length; i++){
        for(j = 0; j < B_row_length; j++){
            vector_product = 0;
            for(k = 0; k < A_row_length; k++)
                vector_product += A[i][k] * B[k][j];

            C[i][j] = vector_product;
        }
    }

    return;
}

void printMatrix(int (*M)[4]){
    int M_row_length = 3;
    int M_column_length = 4;

    int i, j;

    for(i = 0; i < M_row_length; i++){
        for(j = 0; j < M_column_length; j++){
            printf("%4d", M[i][j]);
            if(j == M_column_length - 1)
            printf("\n");
        }
    }

    return;
}

