#include <stdio.h>


void mulMatrix(int A_row_length, int B_row_length, int A_column_length, int B_column_length, int A[][A_row_length], int B[][B_row_length], int C[][B_row_length]);
void printMatrix(int M_row_length, int M_column_length, int M[][M_row_length]);

int main(){
    int A_row_length;
    int A_column_length;
    int B_row_length;
    int B_column_length;
    
    int i, j;

DETERMINE_MATRICES:
    printf("A_row_length = ");
    scanf("%d", &A_row_length);
    printf("A_column_length = ");
    scanf("%d", &A_column_length);

    printf("B_row_length = ");
    scanf("%d", &B_row_length);
    printf("B_column_length = ");
    scanf("%d", &B_column_length);

    if(A_row_length != B_column_length){
	    printf("Invalid size of operand matrices.\n");
	    goto DETERMINE_MATRICES;
    }
    
    int A[A_column_length][A_row_length];
    int B[B_column_length][B_row_length];
    int C[A_column_length][B_row_length];

    printf("Input A row vectors:\n");
    for(i = 0; i < A_column_length; i++)
        for(j = 0; j < A_row_length; j++)
            scanf("%d", &A[i][j]);
	
    printf("Input B row vectors:\n");
    for(i = 0; i < B_column_length; i++)
        for(j = 0; j < B_row_length; j++)
            scanf("%d", &B[i][j]);

    mulMatrix(A_row_length, B_row_length, A_column_length, B_column_length, A, B, C);
    printMatrix(A_column_length, B_row_length, C);

    return 0;
}

void mulMatrix(int A_row_length, int B_row_length,
	       int A_column_length, int B_column_length, 
	       int A[][A_row_length], int B[][B_row_length], int C[][B_row_length]){

    int i, j, k;
    int vector_product;
 
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

void printMatrix(int M_row_length, int M_column_length, int M[][M_row_length]){
    int i, j;

    for(i = 0; i < M_row_length; i++){
        for(j = 0; j < M_column_length; j++){
            printf("%-4d", M[i][j]);
            if(j == M_column_length - 1)
            printf("\n");
        }
    }

    return;
}

