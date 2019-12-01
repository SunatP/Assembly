#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n[3],min;

    for( int i = 0 ; i < 3 ; i++ ){
        scanf(" %d", &n[i]);
    }

    min = n[0];

    if( min > n[1] ){

        min = n[1];

        if( min > n[2] ){
            min = n[2];
        }

    }
    else if( min > n[2] ){
        min = n[2];
    }

    else{

    }

    printf("%d",min);

    return 0;
}
