###############################################################################
###############################################################################
###############################################################################
## TRNIDS: TR National Identifier Suite
###############################################################################

# Python version of program has a few imported packages like below:

# import datetime
# import os
# import random
# import subprocess
# import sys
# import time

# But in Julia version, these packages packed in Julia's Base. Because of that
# there are any imported packages. Voila!

import Dates

###############################################################################
###############################################################################
###############################################################################
## Main Menu And Switch
###############################################################################

function main_menu()
    program_ascii_logo_and_menu = """
████████╗██████╗░███╗░░██╗██╗██████╗░░██████╗
╚══██╔══╝██╔══██╗████╗░██║██║██╔══██╗██╔════╝
░░░██║░░░██████╔╝██╔██╗██║██║██║░░██║╚█████╗░
░░░██║░░░██╔══██╗██║╚████║██║██║░░██║░╚═══██╗
░░░██║░░░██║░░██║██║░╚███║██║██████╔╝██████╔╝
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═════╝░╚═════╝░

[ Nuri ACAR ] [ nuriacar.com ]

[ TRNIDS ] [ TR National Identifier Suite ] [ v0.1.0 : 20201206203040 ]

[ Menu ]
===============================================================================
.
... 1. Check NID Validation
... 2. Generate Last Two Digits
... 3. NID Whois
... 4. Get Possible Relatives
... 5. Generate Random Valid NID
... 6. Generate All Possible NID's

... 98. About & Source Code Repository & Version History
... 99. Exit
===============================================================================
"""

    clear_screen()
    println(program_ascii_logo_and_menu)
end

###############################################################################

function swtch_main_menu_option() # Julia has not switch case.
    println("Select an Option!")
    selected_option = get_chck_positive_numeric()

    if selected_option == 99
        clear_screen()
        println("[ 99. Exit ]")
        prnt_seperator()
        prnt_terminated()
        return false # while loop breaker in main.
    elseif selected_option == 1
        clear_screen()
        println("[ 1. Check NID Validation ]")
        prnt_seperator()
        ctrl_nid_validation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 2
        clear_screen()
        println("[ 2. Generate Last Two Digits ]")
        prnt_seperator()
        ctrl_nid_root_to_nid_generation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 3
        clear_screen()
        println("[ 3. NID Whois ]")
        prnt_seperator()
        ctrl_nid_whois()
        prnt_hit_enter_to_continue()
    elseif selected_option == 4
        clear_screen()
        println("[ 4. Get Possible Relatives ]")
        prnt_seperator()
        ctrl_possible_relatives_generation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 5
        clear_screen()
        println("[ 5. Generate Random Valid NID ]")
        prnt_seperator()
        ctrl_gnrt_prnt_random_valid_nid()
        prnt_hit_enter_to_continue()
    elseif selected_option == 6
        clear_screen()
        println("[ 6. Generate All Possible NID's ]")
        prnt_seperator()
        ctrl_nidspace_generation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 98
        clear_screen()
        println("[ 98. About & Source Code Repository & Version History ]")
        prnt_seperator()
        prnt_about_source_history()
        prnt_hit_enter_to_continue()
    else
        prnt_out_of_option()
        prnt_hit_enter_to_continue()
    end
end

###############################################################################
###############################################################################
###############################################################################
## Printers, Screen Cleaners
###############################################################################

function clear_screen()
    # There are a few is<OS> function in Sys.
    if Sys.iswindows()
        run(`cmd /c cls`); # Only `cls` returns an error.
    elseif Sys.islinux() || Sys.isapple()
        run(`clear`);
    end

    # Check this.
    # write(stdin.buffer, 0x0C)
end

###############################################################################

function prnt_seperator()
    println('=' ^ 79)
end

###############################################################################

function prnt_hit_enter_to_continue()
    print("\nHit 'Enter' to continue to menu!")
    readline()
    clear_screen()
end

###############################################################################

function prnt_newline()
    println("")
end

###############################################################################

function prnt_terminated()
    println("Terminated!\n") # Double newline! First one is in println() fn!
end

###############################################################################

function prnt_out_of_option()
    println("\nOut of Option!")
end

###############################################################################

function prnt_default_option_assigned()
    println("\nOut of Option! Default option assigned!")
end

###############################################################################

function prnt_developing_in_progress()
    println("This option developing in progress for now!")
end

###############################################################################

function prnt_entry_must_be_numeric()
    println("\nEntry must be numeric!")
end

###############################################################################

function prnt_improper_nid_root_entry()
    improper_nid_root_entry_alert = """Improper NID Root Entry!
NID root contains 9 digits! Also, first digit can not be 0!
Please type like this: 123456789"""
    println("\n$(improper_nid_root_entry_alert)\n")
end

###############################################################################

function prnt_improper_nid_entry()
    improper_nid_entry_alert = """Improper NID Entry!
NID contains 11 digits! Also, first digit can not be 0!
Please type like this: 12345678901"""
    println("\n$(improper_nid_entry_alert)\n")
end

###############################################################################

function prnt_nid_is_valid()
    println("\nNID is Valid!")
end

###############################################################################

function prnt_nid_is_not_valid()
    println("\nNID is NOT Valid!")
end
 
###############################################################################

function prnt_valid_nid_is_this()
    println("         ^^---- + The valid NID is this!")
end

###############################################################################

function prnt_entry_must_be_positive_number()
    println("\nEntry must be positive number!")
end

###############################################################################

function prnt_senior_junior_both_heading(proper_nid_root_entry, header_option)
    # Generates last two digits of nid from proper nid root entry and assigns.
    valid_nid = gnrt_last_2_digits_of_nid(proper_nid_root_entry)

    if header_option == 1
        data_to_history_file = "$(valid_nid) <<<<< $(get_date_time())\n\n[ Seniors ]\n\n"
        wrt_data_history(data_to_history_file)

        println("[ 1. Seniors ]")
        prnt_seperator()
    elseif header_option == 2
        data_to_history_file = "$(valid_nid) <<<<< $(get_date_time())\n\n[ Juniors ]\n\n"
        wrt_data_history(data_to_history_file)

        println("[ 2. Juniors ]")
        prnt_seperator()
    elseif header_option == 3
        data_to_history_file = "$(valid_nid) <<<<< $(get_date_time())\n\n[ Seniors & Juniors ]\n\n"
        wrt_data_history(data_to_history_file)

        println("[ 3. Seniors & Juniors ]")
        prnt_seperator()
    else
        data_to_history_file = "$(valid_nid) <<<<< $(get_date_time())\n\n[ Seniors & Juniors ]\n\n"
        wrt_data_history(data_to_history_file)

        println("[ 3. Seniors & Juniors ]")
        prnt_seperator()
    end
end

###############################################################################

function prnt_exit_submenu()
    println("\nAye aye!..")
end

###############################################################################

function prnt_about_source_history()
    about_source_history = """[ About ]  http://nuriacar.com/cevizlab/2020/10/11/mernis-trnids.html

[ Source ] https://github.com/nuriacar/trnids

[ Version History ]
===============================================================================

20190417       :        : Coding with Bash started.

20190423085333 : v0.0.1 : All engines running. Liftoff! We have a liftoff... :)
20190424180421 : v0.0.2 : C generator coded because of slow generating.
20190425010841 : v0.0.3 : Elapsed time function fixed.
20200331161407 :        : Coding with Python3 started.
20200405145247 : v0.0.4 : Done. Ported to Python3.
20200405234321 : v0.0.5 : All nid gen. added on Windows py function.
20200406151747 : v0.0.6 : Keyboard Interrupt errors handled in main.
20200411051239 : v0.0.6 : Program name edited.
20200527004701 :        : Coding with Common Lisp started.
20200601160705 : v0.0.7 : Done. Ported to Common Lisp.
20200603003901 : v0.0.8 : Variable based compilation errors fixed.
20200603003901 : v0.0.8 : let, let*, defvar, defparameter... :(
20200603003901 : v0.0.8 : Program flow changed.
20200606201807 : v0.0.9 : History record. Flow change. Classify.
20200730111939 :          Port to Python3 from Common Lisp started.
20200806135339 : v0.0.9 : Done. Ported to Python3.
20201206203040 : v0.1.0 : After unsuccessful packaging attemp on Python3;
                          version history added, fn name changed.
20211231235523 :          Port to Julia from Python3 started.
20220222222022 :          Port to Julia from Python3 done.

[ TODO List ]
===============================================================================

+ LZMA archiving
+ Autocompete from history file
+ SQLite3 DB
+ Threading
+ Packaging"""

    println(about_source_history)
end

###############################################################################

function prnt_todo_list()
    todo_list = """+ Sqlite3 DB.
+ Packaging."""
    println("\n", todo_list)
end

###############################################################################
###############################################################################
###############################################################################
## File Writer
###############################################################################

function wrt_data_history(data)
    open("trnids_history", "a") do history_file
        write(history_file, data)
    end
end

###############################################################################
###############################################################################
###############################################################################
## Getters, Checkers
###############################################################################

function get_chck_positive_numeric()
    # Attention!
    # Tail-call optimisation (TCO), tail recursion elemination (TRE) thing!
    # 20220109233555
    while true
        # Returns only positive number. If entry not numeric, 0 or negative,
        # loops till entry become positive.
        print("\n>>> ")

        try
            # ...reads user entry.
            int_numeric_entry = parse(Int, readline()) # If entry is integer,
            if int_numeric_entry > 0 # and positive (must)...
                return int_numeric_entry
            else # Else, so not positive...
                # Do nothing. Just warn before next loop.
                prnt_entry_must_be_positive_number()
            end
        catch ArgumentError # Else, so entry is not integer.
            # Do nothing. Just warn before next loop.
            prnt_entry_must_be_numeric()
        end
    end
end

# # This function is clone of above function is bad because of TCO, TRE!

# function get_chck_positive_numeric()
#     # Returns only positive number. If entry not numeric, 0 or negative, 
#     # calls itself till entry become positive.
#     print("\n>>> ")

#     try
#         # ...reads user entry.
#         int_numeric_entry = parse(Int, readline()) # If entry is integer,
#         if int_numeric_entry > 0 # and positive (must)...
#             return int_numeric_entry
#         else # Else, so not positive...
#             # Warns and function calls itself.
#             prnt_entry_must_be_positive_number()
#             return get_chck_positive_numeric()
#         end
#     catch ArgumentError # Else, so entry is not integer.
#         # Warns and function calls itself.
#         prnt_entry_must_be_numeric()
#         return get_chck_positive_numeric()
#     end
# end

###############################################################################

function get_check_nid()
    while true
        println("Type All 11 Digits of NID")

        str_nid_entry = string(get_chck_positive_numeric())

        if length(str_nid_entry) == 11
            nid_entry = parse(Int, str_nid_entry)
            return nid_entry
        else
            prnt_improper_nid_entry()
        end
    end
end

###############################################################################

function get_chck_nid_root()
    while true
        println("Type First 9 Digits of NID")

        str_nid_root_entry = string(get_chck_positive_numeric())

        if length(str_nid_root_entry) == 9
            nid_root_entry = parse(Int, str_nid_root_entry)
            return nid_root_entry
        else
            prnt_improper_nid_root_entry()
        end
    end
end

###############################################################################

function chck_nid_validity(proper_nid_entry)
    # Lets re-generate last two digits for comparison.
    # Line below, passes first 9 digits to generator function.
    # gnrt_last_2_digits_of_nid accepts NID root
    # and NID root has 9 digits. Line below, cuts last two digits of
    # proper_nid_entry, then assigns to proper_nid_entry_root

    # v1
    # proper_nid_entry_root = parse(Int, (SubString(string(proper_nid_entry), 1, 9)))
    # v2
    proper_nid_entry_root = div(proper_nid_entry, 100)

    valid_nid = gnrt_last_2_digits_of_nid(proper_nid_entry_root)

    if proper_nid_entry == valid_nid
        data_to_history_file = "$(valid_nid) <<<<< $(get_date_time())\nNID Valid!\n\n"
        wrt_data_history(data_to_history_file)

        prnt_nid_is_valid()
    else
        data_to_history_file = "$(valid_nid) <<<<< $(get_date_time())\n         ^^---- + The valid NID is this! [Wrong Entry]\n\n"
        wrt_data_history(data_to_history_file)

        prnt_nid_is_not_valid()
        println("\n$(valid_nid)")
        prnt_valid_nid_is_this()
    end
end

###############################################################################
###############################################################################
###############################################################################
## Generators
###############################################################################

function gnrt_random_number(location)
    # 1 to 9 Random Number Generator (.. for only digit 1)
    if location == "without-zero"
        rand((1:9))
        # 0 to 9 Random Number Generator (... for digit 2 to 9)
    elseif location == "normal"
        rand((0:9))
    else
    end
end

###############################################################################

function gnrt_last_2_digits_of_nid(proper_nid_root)
    # int objects are not iterable.
    # For adding digits to array, it can be string!
    str_proper_nid_root = string(proper_nid_root)
    int_array_nid_root = [parse(Int, dgt) for dgt in split(str_proper_nid_root, "")]

    # Copies all array elements to a new array. Remember! Arrays are mutable!
    # v1
    # digits_for_calc = int_array_nid_root[:]
    # v2
    digits_for_calc = copy(int_array_nid_root)

    # Function gets 9 digits but NID contains 11 digits, lets extend.
    dummy_last_2_digits = [0, 0]
    append!(digits_for_calc, dummy_last_2_digits)
    # or
    # append!(digits_for_calc, [0, 0])

    # Now, all clear. This is the NID algorithym:
    # NID root has only 9 digits. 10th and 11th digits generates
    # from root.
    # abs(((odd_digits_sum * 7) - even_digits_sum)) % 10 = 10th digit.
    # Now we have first 10 digits.
    # Sum of first 10 digits % 10 = 11th digit.
    # Done.

    # Gets sum of odd digits.
    odd_digits_sum = sum(digits_for_calc[1:2:end])
    # Gets sum of even digits.
    even_digits_sum = sum(digits_for_calc[2:2:end])

    # Sometimes, NID 10th element calculation returns with negative number.
    # abs() gets absolute value of result.
    # v1
    # digits_for_calc[10] = ((abs((odd_digits_sum * 7) - even_digits_sum)) % 10)
    # v2
    digits_for_calc[10] = mod(abs((odd_digits_sum * 7) - even_digits_sum), 10)

    # v1
    # digits_for_calc[11] = ((odd_digits_sum + even_digits_sum + digits_for_calc[10]) % 10)
    # v2
    # digits_for_calc[11] = (sum(digits_for_calc[1:10]) % 10)
    # v3
    digits_for_calc[11] = mod(sum(digits_for_calc[1:10]), 10)
    
    # Array to string, then string to int for return.
    int_calculated_nid = parse(Int, join(digits_for_calc))
    return int_calculated_nid
end

###############################################################################

function gnrt_prnt_senior(proper_nid_root_entry, relative_count)
    # Relative factor number is: 29999
    senior_nid_root = (proper_nid_root_entry + (relative_count * 29999))

    inrange_senior_nid_root = senior_nid_root

    # If senior nid root < 100000000 or > 999999999
    # calculations going to wrong couse of nid system root range.
    # NID root must be 9 digits.

    # This is the fix:
    if senior_nid_root > 1000000000 # NID root must be 9 digits.
        inrange_senior_nid_root = (100000000 + mod(senior_nid_root, 1000000000))
    end

    # Do relative_count times...
    for n in 1:relative_count
        # Assigns new generated senior nid root for last two generation.
        calculated_senior_nid = gnrt_last_2_digits_of_nid(inrange_senior_nid_root)

        data_to_history_file_and_print = "$(lpad(string(relative_count - n + 1), 3, " ")). $(calculated_senior_nid)\n"
        wrt_data_history(data_to_history_file_and_print)
        print(data_to_history_file_and_print) # Also prints formatted string to screen.

        # Assigns inrange_senior_nid_root to next younger senior
        inrange_senior_nid_root = (inrange_senior_nid_root - 29999)

        # If senior nid root < 100000000 or > 999999999
        # calculations going to wrong couse of nid system root range.
        # NID root must be 9 digits.
        
        # This is the fix.
        # NID root must be 9 digits.

        if inrange_senior_nid_root > 1000000000
            inrange_senior_nid_root = (100000000 + mod(inrange_senior_nid_root, 1000000000))
        end
    end

    wrt_data_history("\n")
end

###############################################################################

function gnrt_prnt_base_person(proper_nid_root_entry)
    data_to_history_file = "===> $(gnrt_last_2_digits_of_nid(proper_nid_root_entry))\n\n"
    wrt_data_history(data_to_history_file)

    println("===> $(gnrt_last_2_digits_of_nid(proper_nid_root_entry))")
end

###############################################################################

function gnrt_prnt_junior(proper_nid_root_entry, relative_count)
    # Relative factor number is: 29999
    junior_nid_root = (proper_nid_root_entry - 29999)

    inrange_junior_nid_root = junior_nid_root
    
    # If junior nid root < 100000000 or > 999999999
    # calculations going to wrong couse of nid system root range.
    # NID root must be 9 digits.

    # This is the fix:
    if junior_nid_root < 100000000 # NID root must be 9 digits.
        inrange_junior_nid_root = (junior_nid_root + 900000000)
    end

    # Do relative_count times...
    for n in 1:relative_count
        # Assigns new generated junior nid root for last two generation.
        calculated_junior_nid = gnrt_last_2_digits_of_nid(inrange_junior_nid_root)

        data_to_history_file_and_print = "$(lpad(string(n), 3, " ")). $(calculated_junior_nid)\n"
        wrt_data_history(data_to_history_file_and_print)
        print(data_to_history_file_and_print) # Also prints formatted string to screen.

        # Assigns inrange_junior_nid_root to next younger junior
        inrange_junior_nid_root = (inrange_junior_nid_root - 29999)
        
        # If junior nid root < 100000000 or > 999999999
        # calculations going to wrong couse of nid system root range.
        # NID root must be 9 digits.
        
        # This is the fix.
        # NID root must be 9 digits.
        if inrange_junior_nid_root < 100000000
            inrange_junior_nid_root = (inrange_junior_nid_root + 900000000)
        end
    end

    wrt_data_history("\n")
end

###############################################################################

function gnrt_nidspace_julia()
    percent = 1
    
    # 999999999 - 100000000 = 899999999
    # 899999999 / 100 ~= 8999999
    # 8999999 ==> percentage trigger

    percentage_trigger = 108999999

    prnt_newline()
    println("Julia Generator is running...\n")

    for nid_root in 100000000:999999999
        if nid_root == percentage_trigger
            println("[ TCKNO : NID ] Done! ==> ... % $(percent)")

            percent += 1
            percentage_trigger += 8999999
        end

        generated_nid = gnrt_last_2_digits_of_nid(nid_root)

        # Adds new line esc. seq. char
        edited_generated_nid_str = "$(generated_nid)\n"

        # Because of with sentence, no necessary to use file.close("file_name").
        # Julia closes the file automatically after operation for us.

        open("trnids.txt", "a") do tckno_file
            write(tckno_file, edited_generated_nid_str)
        end
    end
end

###############################################################################

function gnrt_c_source_file()
    # Attention! Code file including escape characters. 
    # So, must use raw strings.

    c_code = raw"""/* compile: gcc -Wall filename.c -o filename.exe */
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

"""

    # With lines below, Julia closes the file automatically after operation for us.
    open("trnids_generator.c", "w") do c_file
        write(c_file, c_code)
    end
end

###############################################################################
###############################################################################
###############################################################################
## System Operations
###############################################################################

function compile_and_execute_c_program()

    compile_command = `gcc trnids_generator.c -o trnids_generator.exe`
    
    execute_command = `./trnids_generator.exe`

    run(`$compile_command`);
    run(`$execute_command`);
end

###############################################################################

# function archiver()

#     mkdir_command = `mkdir c executable archive`
#     mv_c_exe_command = `mv *.c ./c; mv *.exe ./executable`
#     archiver_command = `tar -cv -lzma -f trnids.txt.lzma trnids.txt`
#     mv_lzma_command = `mv *.lzma ./archive`

#     run(`$mkdir_command`);
#     run(`$mv_c_exe_command`);
#     run(`$archiver_command`);
#     run(`$mv_lzma_command`);
# end

###############################################################################

# function unarchiver()
#     unarchiver_command = `tar --lzma -xvpf ./archive/trnids.txt.lzma`

#     run(`$unarchiver_command`);
# ends

###############################################################################
###############################################################################
###############################################################################
## Controllers
###############################################################################

function ctrl_nid_validation()
    proper_nid_entry = get_check_nid()
    chck_nid_validity(proper_nid_entry)

    # chck_nid_validity(get_check_nid())
end

###############################################################################

function ctrl_nid_root_to_nid_generation()
    proper_nid_root_entry = get_chck_nid_root()

    calculated_nid = gnrt_last_2_digits_of_nid(proper_nid_root_entry)

    data_to_history_file = "$(calculated_nid) <<<<< $(get_date_time())\n         ^^---- + The valid NID is this!\n\n"
    wrt_data_history(data_to_history_file)

    println("\n$(calculated_nid)")

    prnt_valid_nid_is_this()
end

###############################################################################

function ctrl_nid_whois()
    prnt_developing_in_progress()
end

###############################################################################

function ctrl_possible_relatives_generation()
    proper_nid_root_entry = get_chck_nid_root() # Gets valid NID root.

    println("\nHow many relatives want you get?")
    relative_count = get_chck_positive_numeric()

    relative_type_selection_menu = """1. Senior
2. Junior
3. Senior and Junior

Select a type ..."""

    println("\n$(relative_type_selection_menu)")
    selected_relative_type = get_chck_positive_numeric()

    if selected_relative_type == 1 # Senior
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 1)
        prnt_newline()
        gnrt_prnt_senior(proper_nid_root_entry, relative_count)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
    elseif selected_relative_type == 2 # Junior
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 2)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
        prnt_newline()
        gnrt_prnt_junior(proper_nid_root_entry, relative_count)
    elseif selected_relative_type == 3 # Senior and Junior
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 3)
        prnt_newline()
        gnrt_prnt_senior(proper_nid_root_entry, relative_count)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
        prnt_newline()
        gnrt_prnt_junior(proper_nid_root_entry, relative_count)
    else # If entry out of 1,2 or 3; Senior and Junior default.
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 3)
        prnt_default_option_assigned()
        prnt_newline()
        gnrt_prnt_senior(proper_nid_root_entry, relative_count)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
        prnt_newline()
        gnrt_prnt_junior(proper_nid_root_entry, relative_count)
    end
end

###############################################################################

function ctrl_gnrt_prnt_random_valid_nid()
    println("How many random NIDs want you get?")
    random_nid_count = get_chck_positive_numeric()

    prnt_newline()

    data_to_history_file = "[ Random  ] <<<<< " * get_date_time() * "\n\n"
    wrt_data_history(data_to_history_file)

    for i in 1:random_nid_count
        # NID root has only 9 digits. 10th and 11th digits generates from root.
        
        # int_array_random_valid_nid_root = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        int_array_random_valid_nid_root = fill(0, 9)

        # 1st digit must be 1 to 9. (0 not accepted at 1st digit)
        int_array_random_valid_nid_root[1] = gnrt_random_number("without-zero")

        # 2 to 9 digits can be 0 to 9.
        for i in 2:9
            int_array_random_valid_nid_root[i] = gnrt_random_number("normal")
        end

        # int array to int conversion.
        # array to string, then string to int.
        int_random_valid_nid_root = parse(Int, join(int_array_random_valid_nid_root))

        int_random_valid_nid = gnrt_last_2_digits_of_nid(int_random_valid_nid_root)

        wrt_data_history("$(int_random_valid_nid)\n")

        println(int_random_valid_nid)
    end

    wrt_data_history("\n")
end

###############################################################################

function ctrl_nidspace_generation()
    nidspace_gen_explanation_and_menu = """This module contains two different mode:

+ Julia Generator  [ Default  ] [ Slow ] [ ~50 hrs. on i5-2410M ]
+ C Generator      [ Optional ] [ Fast ] [ ~18 min. on i5-2410M ]

Julia Generator will be run with select option '1' below!

But if your system has any C compiler you can select option '2'.

On NT systems, option '2' generates a C source file which name is
'trnids_generator.c'. You can compile 'trnids_generator.c' file
in this directory and generate all possible NIDs with compiled executable.

On *nix systems; option '2' automatically generates, compiles and executes
files and programs.

e.g.

compile : gcc -Wall trnids_generator.c -o trnids_generator.exe
run     : ./trnids_generator.exe

1. Run Julia Generator
2. Run C Generator

9. Exit"""

    println(nidspace_gen_explanation_and_menu)
    nidspace_gen_menu_selection = get_chck_positive_numeric()

    # There are a few is<OS> function in Sys.
    if Sys.iswindows()
        if nidspace_gen_menu_selection == 1 # Julia generation on NT
            gnrt_nidspace_julia()
        elseif nidspace_gen_menu_selection == 2 # C generation on NT
            gnrt_c_source_file()
            println("\nC source file generated! You can compile by yourself.")
        elseif nidspace_gen_menu_selection == 9 # Exit
            prnt_exit_submenu()
        else
            prnt_out_of_option()
        end
    elseif Sys.islinux() || Sys.isapple()
        if nidspace_gen_menu_selection == 1 # Julia generation on Linux or Apple
            gnrt_nidspace_julia()
        elseif nidspace_gen_menu_selection == 2 # C generation on Linux or Apple
            gnrt_c_source_file()
            compile_and_execute_c_program()
        elseif nidspace_gen_menu_selection == 9 # Exit
            prnt_exit_submenu()
        else
            prnt_out_of_option()
        end
    else
        prnt_out_of_option()
    end
end

###############################################################################
###############################################################################
###############################################################################
## Date, Time Getters, Printers
###############################################################################

function get_date_time()
    return Dates.format(Dates.now(), "HH:MM:SS, E, dd/mm/yyyy")

    # # clean
    # now = Dates.now()
    # # H:M:S, Week day, dd/mm/YY
    # dt_string = Dates.format(now, "HH:MM:SS, E, dd/mm/yyyy")
    # return dt_string
end

###############################################################################
###############################################################################
###############################################################################
## Main
###############################################################################

function main()
    ###########################################################################
    # Gets time now for elapsed time calculation.
    start_time = time() # Returns float.
    ###########################################################################

    try
        while true
            main_menu()

            while_breaker = swtch_main_menu_option()
            
            if while_breaker == false # 99 Menu Exit.
                break
            end
        end
    catch e
        # If ctrl + c pressed while code is running...
        # ctrl + c does not interrupt. This is an open issue.
        if e isa InterruptException
            prnt_newline()
            prnt_newline()
            print("Keyboard Interrupt Termination!")
            prnt_newline()
        elseif EOFError # Input Error handler.
            prnt_newline()
            prnt_newline()
            print("Input Error Termination!")
            prnt_newline()
        else
            rethrow(e)
        end
    end

    ###########################################################################
    # Gets duration time from start_time till now.
    duration = time() - start_time # Returns float. So convert to int.

    hours = trunc(Int, duration / 3600)
    minutes = trunc(Int, (duration / 60) % 60)
    seconds = trunc(Int, duration % 60)

    prnt_seperator()

    if hours > 0
        println("[ Done! ] ====> $(hours) h. $(minutes) m. $(seconds) s.")
    elseif minutes > 0
        println("[ Done! ] ====> $(minutes) m. $(seconds) s.")
    else
        println("[ Done! ] ====> $(seconds) s.")
    end
    ###########################################################################
end

###############################################################################
# https://docs.julialang.org/en/v1/manual/faq/#How-do-I-check-if-the-current-file-is-being-run-as-the-main-script?
 
if abspath(PROGRAM_FILE) == @__FILE__
    # Note:
    # Assigning a macro value to variable:
    # https://discourse.julialang.org/t/assigning-a-macro-to-a-variable/3773
    # @eval const $(Symbol("@duration")) = $(Symbol("@time"))
    
    # @time main()
    main()
end
