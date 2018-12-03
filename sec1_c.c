#include <stdio.h>
// Sunat Praphanwong 6088130
int main()
{
    int i,n;
    float sum=0;
    for(i=1;i<=3;i++)
    {
        printf("Input number %d: " ,i);
        scanf("%d", &n);
        sum=sum+n;
    }

    printf("Average is: %.2f\n",sum/3);
    system("pause");
    return 0;
}