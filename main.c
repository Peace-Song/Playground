#include <stdio.h>

int main(){
    char ID[8];
    char name[10];
    int i;
    fputs("Type your 6-digit student ID: ", stdout);
    fgets(ID, sizeof(ID), stdin);
   
    if(ID[sizeof(ID)-1] == '\n') 
        while(getchar() != '\n');

/*    printf("DEBUG: ");
    for(i = 0; i < sizeof(ID); i++){
        if(ID[i] == '\0') printf("\\0");
        if(ID[i] == '\n') printf("\\n");
        else printf("%c", ID[i]);
    }
    printf("\n");
    printf("DEBUG: sizeof(ID) == %ld\n", sizeof(ID));

    for(i = 0; i < sizeof(ID); i++)
        if(ID[i] == '\n') 
            ID[i] = '\0';
            
*/
    fputs("Type your name: ", stdout);
    fgets(name, sizeof(name), stdin);

    if(name[sizeof(name)-1] == '\n')
        while(getchar() != '\n');

    for(i = 0; i < sizeof(ID); i++)
        if(ID[i] == '\n') 
            ID[i] = '\0';


    printf("ID: %s\n", ID);
    printf("Name: %s\n", name);

    return 0;
}

