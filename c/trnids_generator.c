/* compile: gcc -Wall filename.c -o filename.exe */
/* run: ./filename.exe */

#include <stdio.h>
#include <stdlib.h> /* abs() */
#include <time.h>

int main(void)
{
    clock_t timeStart = clock(); /* execution time calculation */

    printf("[ TCKNO : NID ] All space generating in \
'./trnids.txt' file ...\n\n");
    
    static char szWriteFile[10];
    sprintf(szWriteFile, "trnids.txt");
    FILE *fpWriteFile = fopen(szWriteFile, "a");
    
    int percent = 1;
    /* 
    999999999 - 100000000 = 899999999
    899999999 / 100 ~= 8999999
    8999999 ==> percentage trigger
    */
    int percentage_trigger = 108999999;
    
    for(int nid_root = 100000000; nid_root <= 999999999; nid_root++)
    {
        if (nid_root == percentage_trigger)
        {
            printf("[ TCKNO : NID ] Done! ==> ... %% %d\n", percent);
            
            percent++;
            percentage_trigger += 8999999;
        }
        
        int nid_root_copy = nid_root; /* for safety */

        int valid_nid[11] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

        /* number digits to array */
        for(int i = 8; i >= 0; i--)
        {
            valid_nid[i] = nid_root_copy % 10;
            nid_root_copy = nid_root_copy / 10;
        }

        int odd_digits_sum = 0;
        int even_digits_sum = 0;

        odd_digits_sum = valid_nid[0] + valid_nid[2] 
                        + valid_nid[4] + valid_nid[6] + valid_nid[8];
        
        even_digits_sum = valid_nid[1] 
                        + valid_nid[3] + valid_nid[5] + valid_nid[7];

        valid_nid[9] = (abs( (odd_digits_sum * 7) - even_digits_sum )) % 10;
        
        valid_nid[10] = ( odd_digits_sum + even_digits_sum 
                            + valid_nid[9] ) % 10;
        
        /* write all elements of array one by one to file */
        for(int v = 0; v < 11; v++)
        {
            fprintf(fpWriteFile, "%d", valid_nid[v]);
        }

        fprintf(fpWriteFile, "\n"); /* to new line */
    }

    fclose(fpWriteFile);

    printf("\n");

    /* lets check the spent time */

    clock_t timeEnd = clock();
    double timeSpent = (double)(timeEnd - timeStart) / CLOCKS_PER_SEC;

    int int_time_spent = timeSpent;

    int hours = int_time_spent / 3600;
    int minutes = (int_time_spent / 60) % 60;
    int seconds = int_time_spent % 60;

    if ( hours > 0 )
    {
        printf("[ TCKNO : NID ] Done! ==> ... in %d h. %d m. %d s.\n", 
        hours, minutes, seconds);
    }
    else if ( minutes > 0 )
    {
        printf("[ TCKNO : NID ] Done! ==> ... in %d m. %d s.\n", 
        minutes, seconds);
    }
    else
    {
        printf("[ TCKNO : NID ] Done! ==> ... in %d s.\n", 
        seconds);
    }

    //printf("[ TCKNO : NID ] Done! ==> ... in %.3f s.\n", timeSpent);

    return 0;
}

