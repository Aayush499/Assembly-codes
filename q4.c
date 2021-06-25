#include <stdio.h>

int search(char c[33], int n);



int main(void)
{
    char c[33]= "zz5NCiYsLpLcRT9svF1oEk12ZSHIR0DD";
     printf("%s\n",c);
        for(int i=65; i<=90;i++)
       {
          
            printf("%c %d",i,search(c, i));
            puts("");
       }
	

    return 0;
}
