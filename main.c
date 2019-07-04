#include <stdio.h>

int main(){
    char str[50];
    char dst_str[50];
    int i, j;
    printf("input string: ");
    for(i = 0; i < 50; i++){
        scanf("%c", &str[i]);
        if(str[i] == '\n') break;
    }
    
    //str[i] = '\0';

    //printf("input string echo: %s\n", str);

    printf("input string echo: ");
    for(i = 0; i < 50; i++){
        printf("%c", str[i]);
        if(str[i] == '\n') break;
    }

    for(j = 0; j < i; j++)
        dst_str[j] = str[i-j-1];
    dst_str[i] = '\n';

    //dst_str[j] = '\0';

    //printf("output: %s\n", dst_str);

    printf("output string: ");
    for(j = 0; j < 50; j++){
        printf("%c", dst_str[j]);
        if(dst_str[j] == '\n') break;
    }
        
}
