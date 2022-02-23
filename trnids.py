#!/usr/bin/env python3
# -*- coding: utf-8 -*-

###############################################################################
###############################################################################
###############################################################################
## TRNIDS: TR National Identifier Suite
###############################################################################

import datetime
import os
import random
import subprocess
import sys
import time

###############################################################################
###############################################################################
###############################################################################
## Main Menu And Switch
###############################################################################

def main_menu():
    # https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Nuri%20ACAR
    program_ascii_logo_and_menu = """
████████╗██████╗ ███╗   ██╗██╗██████╗ ███████╗
╚══██╔══╝██╔══██╗████╗  ██║██║██╔══██╗██╔════╝
   ██║   ██████╔╝██╔██╗ ██║██║██║  ██║███████╗
   ██║   ██╔══██╗██║╚██╗██║██║██║  ██║╚════██║
   ██║   ██║  ██║██║ ╚████║██║██████╔╝███████║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═════╝ ╚══════╝

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
    print("{}".format(program_ascii_logo_and_menu))

###############################################################################

def swtch_main_menu_option(): # Python has not switch case.
    print("Select an Option!")
    selected_option = get_chck_positive_numeric()

    if selected_option == 99:
        clear_screen()
        print("[ 99. Exit ]")
        prnt_seperator()
        prnt_terminated()
        return False # while loop breaker in main.
    elif selected_option == 1:
        clear_screen()
        print("[ 1. Check NID Validation ]")
        prnt_seperator()
        ctrl_nid_validation()
        prnt_hit_enter_to_continue()
    elif selected_option == 2:
        clear_screen()
        print("[ 2. Generate Last Two Digits ]")
        prnt_seperator()
        ctrl_nid_root_to_nid_generation()
        prnt_hit_enter_to_continue()
    elif selected_option == 3:
        clear_screen()
        print("[ 3. NID Whois ]")
        prnt_seperator()
        ctrl_nid_whois()
        prnt_hit_enter_to_continue()
    elif selected_option == 4:
        clear_screen()
        print("[ 4. Get Possible Relatives ]")
        prnt_seperator()
        ctrl_possible_relatives_generation()
        prnt_hit_enter_to_continue()
    elif selected_option == 5:
        clear_screen()
        print("[ 5. Generate Random Valid NID ]")
        prnt_seperator()
        ctrl_gnrt_prnt_random_valid_nid()
        prnt_hit_enter_to_continue()
    elif selected_option == 6:
        clear_screen()
        print("[ 6. Generate All Possible NID's ]")
        prnt_seperator()
        ctrl_nidspace_generation()
        prnt_hit_enter_to_continue()
    elif selected_option == 98:
        clear_screen()
        print("[ 98. About & Source Code Repository & Version History ]")
        prnt_seperator()
        prnt_about_source_history()
        prnt_hit_enter_to_continue()
    else:
        prnt_out_of_option()
        prnt_hit_enter_to_continue()

###############################################################################
###############################################################################
###############################################################################
## Printers, Screen Cleaners
###############################################################################

# function v.1

# def clear_screen():
#     if os.name == "nt":
#         os.system("cls")
#     else:
#         os.system("clear")


# function v.2 (shortest version of v.1)

def clear_screen():
    os.system("cls" if os.name == "nt" else "clear")

###############################################################################

def prnt_seperator():
    print("=" * 79)

###############################################################################

def prnt_hit_enter_to_continue():
    input("\nHit 'Enter' to continue to menu!")
    clear_screen()

###############################################################################

def prnt_newline():
    print("")

###############################################################################

def prnt_terminated():
    print("Terminated!\n") # Double newline! First one is in print() fn!

###############################################################################

def prnt_out_of_option():
    print("\nOut of Option!")

###############################################################################

def prnt_default_option_assigned():
    print("\nOut of Option! Default option assigned!")

###############################################################################

def prnt_developing_in_progress():
    print("This option developing in progress for now!")

###############################################################################

def prnt_entry_must_be_numeric():
    print("\nEntry must be numeric!")

###############################################################################

def prnt_improper_nid_root_entry():
    improper_nid_root_entry_alert = """Improper NID Root Entry!
NID root contains 9 digits! Also, first digit can not be 0!
Please type like this: 123456789"""
    print("\n{}\n".format(improper_nid_root_entry_alert))

###############################################################################

def prnt_improper_nid_entry():
    improper_nid_entry_alert = """Improper NID Entry!
NID contains 11 digits! Also, first digit can not be 0!
Please type like this: 12345678901"""
    print("\n{}\n".format(improper_nid_entry_alert))

###############################################################################

def prnt_nid_is_valid():
    print("\nNID is Valid!")

###############################################################################

def prnt_nid_is_not_valid():
    print("\nNID is NOT Valid!")

###############################################################################

def prnt_valid_nid_is_this():
    print("         ^^---- + The valid NID is this!")

###############################################################################

def prnt_entry_must_be_positive_number():
    print("\nEntry must be positive number!")

###############################################################################

def prnt_senior_junior_both_heading(proper_nid_root_entry, header_option):
    # Generates last two digits of nid from proper nid root entry and assigns.
    valid_nid = gnrt_last_2_digits_of_nid(proper_nid_root_entry)

    if header_option == 1:
        data_to_history_file = "{} <<<<< {}\n\n[ Seniors ]\n\n"\
            .format(valid_nid, get_date_time())
        wrt_data_history(data_to_history_file)

        print("[ 1. Seniors ]")
        prnt_seperator()
    elif header_option == 2:
        data_to_history_file = "{} <<<<< {}\n\n[ Juniors ]\n\n"\
            .format(valid_nid, get_date_time())
        wrt_data_history(data_to_history_file)

        print("[ 2. Juniors ]")
        prnt_seperator()
    elif header_option == 3:
        data_to_history_file = "{} <<<<< {}\n\n[ Seniors & Juniors ]\n\n"\
            .format(valid_nid, get_date_time())
        wrt_data_history(data_to_history_file)

        print("[ 3. Seniors & Juniors ]")
        prnt_seperator()
    else:
        data_to_history_file = "{} <<<<< {}\n\n[ Seniors & Juniors ]\n\n"\
            .format(valid_nid, get_date_time())
        wrt_data_history(data_to_history_file)

        print("[ 3. Seniors & Juniors ]")
        prnt_seperator()

###############################################################################

def prnt_exit_submenu():
    print("\nAye aye!..")

###############################################################################

def prnt_about_source_history():
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

    print("{}".format(about_source_history))

###############################################################################

def prnt_todo_list():
    todo_list = """+ Sqlite3 DB.
+ Packaging."""
    print("\n{}".format(todo_list))

###############################################################################
###############################################################################
###############################################################################
## File Writer
###############################################################################

def wrt_data_history(data):
    with open("trnids_history", "a") as history_file:
        history_file.writelines(data)

###############################################################################
###############################################################################
###############################################################################
## Getters, Checkers
###############################################################################

def get_chck_positive_numeric():
    # Attention!
    # Tail-call optimisation (TCO), tail recursion elemination (TRE) thing!
    # https://neopythonic.blogspot.com/2009/04/tail-recursion-elimination.html
    # https://neopythonic.blogspot.com/2009/04/final-words-on-tail-calls.html
    # 20220109233555
    while True:
        # Returns only positive number. If entry not numeric, 0 or negative,
        # loops till entry become positive.
        str_numeric_entry = input("\n>>> ") # ...reads user entry.

        try:
            int_numeric_entry = int(str_numeric_entry) # If entry is integer,
            if int_numeric_entry > 0: # and positive (must)...
                return int_numeric_entry
            else: # Else, so not positive...
                # Do nothing. Just warn before next loop.
                prnt_entry_must_be_positive_number()
        except ValueError: # Else, so entry is not integer.
            # Do nothing. Just warn before next loop.
            prnt_entry_must_be_numeric()

# # This function is clone of above function is bad because of TCO, TRE!

# def get_chck_positive_numeric():
#     # Returns only positive number. If entry not numeric, 0 or negative, 
#     # calls itself till entry become positive.
#     str_numeric_entry = input("\n>>> ") # ...reads user entry.

#     try:
#         int_numeric_entry = int(str_numeric_entry) # If entry is integer,
#         if int_numeric_entry > 0: # and positive (must)...
#             return int_numeric_entry
#         else: # Else, so not positive...
#             prnt_entry_must_be_positive_number()

#             # Because of function recall inside itself, value become None.
#             # So, return is important below!
#             # Returns proper value of function call n to function call 1!
#             return get_chck_positive_numeric()
#     except ValueError: # Else, so entry is not integer.
#         prnt_entry_must_be_numeric()

#         # Because of function recall inside itself, value become None.
#         # So, return is important below!
#         # Returns proper value of function call n to function call 1!
#         return get_chck_positive_numeric()

###############################################################################

def get_check_nid():
    while True:
        print("Type All 11 Digits of NID")
        str_nid_entry = str(get_chck_positive_numeric())

        if len(str_nid_entry) == 11:
            nid_entry = int(str_nid_entry)
            return nid_entry
        else:
            prnt_improper_nid_entry()

# # This function is clone of above function is bad because of TCO, TRE!

# def get_check_nid():
#     print("Type All 11 Digits of NID")
#     str_nid_entry = str(get_chck_positive_numeric())

#     if len(str_nid_entry) == 11:
#         nid_entry = int(str_nid_entry)
#         return nid_entry
#     else:
#         prnt_improper_nid_entry()
#         return get_check_nid()

###############################################################################

def get_chck_nid_root():
    while True:
        print("Type First 9 Digits of NID")

        str_nid_root_entry = str(get_chck_positive_numeric())

        if len(str_nid_root_entry) == 9:
            nid_root_entry = int(str_nid_root_entry)
            return nid_root_entry
        else:
            prnt_improper_nid_root_entry()

# # This function is clone of above function is bad because of TCO, TRE!

# def get_chck_nid_root():
#     print("Type First 9 Digits of NID")

#     str_nid_root_entry = str(get_chck_positive_numeric())

#     if len(str_nid_root_entry) == 9:
#         nid_root_entry = int(str_nid_root_entry)
#         return nid_root_entry
#     else:
#         prnt_improper_nid_root_entry()
#         return get_chck_nid_root()

###############################################################################

def chck_nid_validity(proper_nid_entry):
    # Lets re-generate last two digits for comparison.
    # Line below, passes first 9 digits to generator function.
    # gnrt_last_2_digits_of_nid accepts NID root
    # and NID root has 9 digits. Line below, cuts last two digits of
    # proper_nid_entry, then assigns to proper_nid_entry_root

    # v1
    # proper_nid_entry_root = str(proper_nid_entry)[0:9]
    # v2. div operation returns float, so it has to cast int.
    proper_nid_entry_root = int(proper_nid_entry / 100)
    
    valid_nid = gnrt_last_2_digits_of_nid(proper_nid_entry_root)

    if proper_nid_entry == valid_nid:
        data_to_history_file = "{} <<<<< {}\nNID Valid!\n\n"\
            .format(valid_nid, get_date_time())
        wrt_data_history(data_to_history_file)

        prnt_nid_is_valid()
    else:
        data_to_history_file = "{} <<<<< {}\n{}\n\n"\
                .format(valid_nid, get_date_time(), \
                    "         ^^---- + The valid NID is this! [Wrong Entry]")
        wrt_data_history(data_to_history_file)

        prnt_nid_is_not_valid()
        print("\n{}".format(valid_nid))
        prnt_valid_nid_is_this()

###############################################################################
###############################################################################
###############################################################################
## Generators
###############################################################################

def gnrt_random_number(location):
    # 1 to 9 Random Number Generator (.. for only digit 1)
    if location == "without-zero":
        random_number = random.randint(1, 9)
        return random_number
    
    # 0 to 9 Random Number Generator (... for digit 2 to 9)
    if location == "normal":
        random_number = random.randint(0, 9)
        return random_number

###############################################################################

def gnrt_last_2_digits_of_nid(proper_nid_root):
    # int objects are not iterable.
    # For adding digits to list, it can be string!
    str_proper_nid_root = str(proper_nid_root)
    int_list_nid_root = list(map(int, str_proper_nid_root))

    # Copies all list elements to a new list. Remember! Lists are mutable!
    digits_for_calc = int_list_nid_root[:]
    
    # Function gets 9 digits but NID contains 11 digits, lets extend.
    dummy_last_2_digits = [0, 0]
    digits_for_calc.extend(dummy_last_2_digits)

    # Now, all clear. This is the NID algorithym:
    # NID root has only 9 digits. 10th and 11th digits generates
    # from root.
    # abs(((odd_digits_sum * 7) - even_digits_sum)) % 10 = 10th digit.
    # Now we have first 10 digits.
    # Sum of first 10 digits % 10 = 11th digit.
    # Done.

    # Gets sum of odd digits.
    odd_digits_sum = sum(digits_for_calc[0:10:2])
    # Gets sum of even digits.
    even_digits_sum = sum(digits_for_calc[1:9:2])

    # Sometimes, NID 10th element calculation returns with negative number.
    # abs() gets absolute value of result. There is a weird situation in
    # python! abs(-n % m) != (abs(-n)) % m. Check python negative modulo on
    # web. So, good approach is get abs value first, then modulo!
    digits_for_calc[9] = \
        ((abs((odd_digits_sum * 7) - even_digits_sum)) % 10)
    
    digits_for_calc[10] = \
        ((odd_digits_sum + even_digits_sum + digits_for_calc[9]) % 10)

    # list to string, then string to int for return.
    int_calculated_nid = int(''.join(map(str, digits_for_calc)))
    return int_calculated_nid

###############################################################################

def gnrt_prnt_senior(proper_nid_root_entry, relative_count):

    # Relative factor number is: 29999
    senior_nid_root = \
        (proper_nid_root_entry + (relative_count * 29999))

    inrange_senior_nid_root = senior_nid_root
    
    # If senior nid root < 100000000 or > 999999999
    # calculations going to wrong couse of nid system root range.
    # NID root must be 9 digits.

    # This is the fix:
    if senior_nid_root > 1000000000: # NID root must be 9 digits.
        inrange_senior_nid_root = \
            (100000000 + (senior_nid_root % 1000000000))
    
    # Do relative_count times...
    for n in range(0, relative_count):
        # Assigns new generated senior nid root for last two generation.
        calculated_senior_nid = \
            gnrt_last_2_digits_of_nid(inrange_senior_nid_root)

        data_to_history_file = \
            "{:>3}. {}\n".format((relative_count - n), calculated_senior_nid)
        wrt_data_history(data_to_history_file)
        
        print("{:>3}. {}"\
            .format(str(relative_count - n), calculated_senior_nid))
        
        # Assigns inrange_senior_nid_root to next younger senior
        inrange_senior_nid_root = (inrange_senior_nid_root - 29999)
        
        # If senior nid root < 100000000 or > 999999999
        # calculations going to wrong couse of nid system root range.
        # NID root must be 9 digits.
        
        # This is the fix.
        # NID root must be 9 digits.
        if inrange_senior_nid_root > 1000000000:
            inrange_senior_nid_root = \
                (100000000 + (inrange_senior_nid_root % 1000000000))
    
    wrt_data_history("\n")

###############################################################################

def gnrt_prnt_base_person(proper_nid_root_entry):

    data_to_history_file = \
        "===> {}\n\n"\
            .format(gnrt_last_2_digits_of_nid(proper_nid_root_entry))
    wrt_data_history(data_to_history_file)
    
    print("===> {}"\
        .format(gnrt_last_2_digits_of_nid(proper_nid_root_entry)))

###############################################################################

def gnrt_prnt_junior(proper_nid_root_entry, relative_count):

    # Relative factor number is: 29999
    junior_nid_root = (proper_nid_root_entry - 29999)

    inrange_junior_nid_root = junior_nid_root
    
    # If junior nid root < 100000000 or > 999999999
    # calculations going to wrong couse of nid system root range.
    # NID root must be 9 digits.

    # This is the fix:
    if junior_nid_root < 100000000: # NID root must be 9 digits.
        inrange_junior_nid_root = \
            (junior_nid_root + 900000000)
    
    # Do relative_count times...
    for n in range(0, relative_count):
        # Assigns new generated junior nid root for last two generation.
        calculated_junior_nid = \
            gnrt_last_2_digits_of_nid(inrange_junior_nid_root)

        data_to_history_file = \
            "{:>3}. {}\n".format((n + 1), calculated_junior_nid)
        wrt_data_history(data_to_history_file)
        
        print("{:>3}. {}".format(str(n + 1), calculated_junior_nid))
        
        # Assigns inrange_junior_nid_root to next younger junior
        inrange_junior_nid_root = (inrange_junior_nid_root - 29999)
        
        # If junior nid root < 100000000 or > 999999999
        # calculations going to wrong couse of nid system root range.
        # NID root must be 9 digits.
        
        # This is the fix.
        # NID root must be 9 digits.
        if inrange_junior_nid_root < 100000000:
            inrange_junior_nid_root = \
                (inrange_junior_nid_root + 900000000)

    wrt_data_history("\n")

###############################################################################

def gnrt_nidspace_python():
    percent = 1
    
    # 999999999 - 100000000 = 899999999
    # 899999999 / 100 ~= 8999999
    # 8999999 ==> percentage trigger

    percentage_trigger = 108999999

    prnt_newline()
    print("Python Generator is running...\n")

    for nid_root in range(100000000, 1000000000):

        if nid_root == percentage_trigger:
            print("[ TCKNO : NID ] Done! ==> ... {} {}".format("%", percent))
            
            percent += 1
            percentage_trigger += 8999999

        generated_nid = gnrt_last_2_digits_of_nid(nid_root)
        
        # Adds new line esc. seq. char
        edited_generated_nid_str = "{}\n".format(generated_nid)

        # Because of with sentence, no necessary to use file.close("file_name").
        # Python closes the file automatically after operation for us.
        with open("trnids.txt", "a") as tckno_file:
            tckno_file.writelines(edited_generated_nid_str)

###############################################################################

def gnrt_c_source_file():

    # Attention! Code file including escape characters. 
    # So, must use r strings.

    c_code = r"""/* compile: gcc -Wall filename.c -o filename.exe */
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
    
    # Because of with sentence, no necessary to use file.close("file_name").
    # Python closes the file automatically after operation for us.
    with open("trnids_generator.c", "w") as c_file:
        c_file.write(c_code)

###############################################################################
###############################################################################
###############################################################################
## System Operations
###############################################################################

def compile_and_execute_c_program():
    # r String mix commands with ';'
    
    # commands
    # gcc trnids_generator.c -o trnids_generator.exe;
    # ./trnids_generator.exe;

    
    compile_command = "gcc trnids_generator.c -o trnids_generator.exe"
    
    execute_command = "./trnids_generator.exe"

    subprocess.check_call(compile_command, shell = True)

    subprocess.check_call(execute_command, shell = True)

# ###############################################################################
# # Cleaner, Archiver

# def archiver():

#     mkdir_command = "mkdir c executable archive"
#     mv_c_exe_command = "mv *.c ./c; mv *.exe ./executable"
#     archiver_command = "tar -cv -lzma -f trnids.txt.lzma trnids.txt"
#     mv_lzma_command = "mv *.lzma ./archive"

#     subprocess.check_call(mkdir_command, shell = True)

#     subprocess.check_call(mv_c_exe_command, shell = True)

#     subprocess.check_call(archiver_command, shell = True)

#     subprocess.check_call(mv_lzma_command, shell = True)

# ###############################################################################
# # Unarchiver

# def unarchiver():
#     unarchiver_command = "tar --lzma -xvpf ./archive/trnids.txt.lzma"

#     subprocess.check_call(unarchiver_command, shell = True)

###############################################################################
###############################################################################
###############################################################################
## Controllers
###############################################################################

def ctrl_nid_validation():
    proper_nid_entry = get_check_nid()
    chck_nid_validity(proper_nid_entry)

    # chck_nid_validity(get_check_nid())

###############################################################################

def ctrl_nid_root_to_nid_generation():
    proper_nid_root_entry = get_chck_nid_root()

    calculated_nid = gnrt_last_2_digits_of_nid(proper_nid_root_entry)

    data_to_history_file = "{} <<<<< {}\n{}\n\n"\
            .format(calculated_nid, get_date_time(), \
                "         ^^---- + The valid NID is this!")
    wrt_data_history(data_to_history_file)

    print("\n{}".format(calculated_nid))

    prnt_valid_nid_is_this()

###############################################################################

def ctrl_nid_whois():
    prnt_developing_in_progress()

###############################################################################

def ctrl_possible_relatives_generation():
    proper_nid_root_entry = get_chck_nid_root() # Gets valid NID root.

    print("\nHow many relatives want you get?")
    relative_count = get_chck_positive_numeric()

    relative_type_selection_menu = """1. Senior
2. Junior
3. Senior and Junior

Select a type ..."""
    print("\n{}".format(relative_type_selection_menu))
    selected_relative_type = get_chck_positive_numeric()

    if selected_relative_type == 1: # Senior
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 1)
        prnt_newline()
        gnrt_prnt_senior(proper_nid_root_entry, relative_count)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
    elif selected_relative_type == 2: # Junior
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 2)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
        prnt_newline()
        gnrt_prnt_junior(proper_nid_root_entry, relative_count)
    elif selected_relative_type == 3: # Senior and Junior
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 3)
        prnt_newline()
        gnrt_prnt_senior(proper_nid_root_entry, relative_count)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
        prnt_newline()
        gnrt_prnt_junior(proper_nid_root_entry, relative_count)
    else: # If entry out of 1,2 or 3; Senior and Junior default.
        clear_screen()
        prnt_senior_junior_both_heading(proper_nid_root_entry, 3)
        prnt_default_option_assigned()
        prnt_newline()
        gnrt_prnt_senior(proper_nid_root_entry, relative_count)
        prnt_newline()
        gnrt_prnt_base_person(proper_nid_root_entry)
        prnt_newline()
        gnrt_prnt_junior(proper_nid_root_entry, relative_count)

###############################################################################

def ctrl_gnrt_prnt_random_valid_nid():
    print("How many random NIDs want you get?")
    random_nid_count = get_chck_positive_numeric()

    prnt_newline()

    data_to_history_file = "[ Random  ] <<<<< " + get_date_time() + "\n\n"
    wrt_data_history(data_to_history_file)

    for i in range(random_nid_count):
        # NID root has only 9 digits. 10th and 11th digits generates from root.
        int_lst_random_valid_nid_root = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

        # 1st digit must be 1 to 9. (0 not accepted at 1st digit)
        int_lst_random_valid_nid_root[0] = gnrt_random_number("without-zero")

        # 2 to 9 digits can be 0 to 9.
        for i in range(1, 9):
            int_lst_random_valid_nid_root[i] = gnrt_random_number("normal")
        
        # int array to int conversion.
        int_random_valid_nid_root = \
            int("".join(map(str, int_lst_random_valid_nid_root[0:9])))

        int_random_valid_nid = \
            gnrt_last_2_digits_of_nid(int_random_valid_nid_root)
        
        wrt_data_history("{}\n".format(int_random_valid_nid))
        
        print(int_random_valid_nid)
    
    wrt_data_history("\n")

###############################################################################

def ctrl_nidspace_generation():
    nidspace_gen_explanation_and_menu = \
        """This module contains two different mode:

+ Python Generator [ Default  ] [ Slow ] [ ~55 hrs. on i5-2410M ]
+ C Generator      [ Optional ] [ Fast ] [ ~18 min. on i5-2410M ]

Python Generator will be run with select option '1' below!

But if your system has any C compiler you can select option '2'.

On NT systems, option '2' generates a C source file which name is
'trnids_generator.c'. You can compile 'trnids_generator.c' file
in this directory and generate all possible NIDs with compiled executable.

On *nix systems; option '2' automatically generates, compiles and executes
files and programs.

e.g.

compile : gcc -Wall trnids_generator.c -o trnids_generator.exe
run     : ./trnids_generator.exe

1. Run Python Generator
2. Run C Generator

9. Exit"""

    print(nidspace_gen_explanation_and_menu)
    nidspace_gen_menu_selection = get_chck_positive_numeric()

    if os.name == "nt":
        if nidspace_gen_menu_selection == 1: # Python generation on NT
            gnrt_nidspace_python()
        elif nidspace_gen_menu_selection == 2: # C generation on NT
            gnrt_c_source_file()
            print("\nC source file generated! You can compile by yourself.")
        elif nidspace_gen_menu_selection == 9: # Exit
            prnt_exit_submenu()
        else:
            prnt_out_of_option()
    elif os.name == "posix":
        if nidspace_gen_menu_selection == 1: # Python generation on Posix
            gnrt_nidspace_python()
        elif nidspace_gen_menu_selection == 2: # C generation on Posix
            gnrt_c_source_file()
            compile_and_execute_c_program()
        elif nidspace_gen_menu_selection == 9: # Exit
            prnt_exit_submenu()
        else:
            prnt_out_of_option()
    else:
        prnt_out_of_option()

###############################################################################
###############################################################################
###############################################################################
## Date, Time Getters, Printers
###############################################################################

def get_date_time():
    # H:M:S, Week day, dd/mm/YY
    return datetime.datetime.now().strftime("%H:%M:%S, %A, %d/%m/%Y")

    # # clean
    # now = datetime.datetime.now()
    # # H:M:S, Week day, dd/mm/YY
    # dt_string = now.strftime("%H:%M:%S, %A, %d/%m/%Y")
    # return dt_string

###############################################################################
###############################################################################
###############################################################################
## Main
###############################################################################

def main():
    ###########################################################################
    # Gets time now for elapsed time calculation.
    start_time = time.time() # Returns float.
    ###########################################################################
    
    # ctrl + c termination and input error handler
    try:
        while True:
            main_menu()
            while_breaker = swtch_main_menu_option()
            if while_breaker == False: # 99 Menu Exit.
                break
    except KeyboardInterrupt: # If ctrl + c pressed while code is running...
        prnt_newline()
        prnt_newline()
        print("Keyboard Interrupt Termination!")
        prnt_newline()
    except EOFError: # Input Error handler.
        prnt_newline()
        prnt_newline()
        print("Input Error Termination!")
        prnt_newline()
    
    ###########################################################################
    # Gets duration time from start_time till now.
    duration = time.time() - start_time # Returns float. So convert to int.
    
    hours = int(duration / 3600)
    minutes = int((duration / 60) % 60)
    seconds = int(duration % 60)

    prnt_seperator()

    if hours > 0:
        print("[ Done! ] ====> {0} h. {1} m. {2} s."\
            .format(hours, minutes, seconds))
    elif minutes > 0:
        print("[ Done! ] ====> {0} m. {1} s."\
            .format(minutes, seconds))
    else:
        print("[ Done! ] ====> {0} s."\
            .format(seconds))
    ###########################################################################

###############################################################################

if __name__ == "__main__":
    if sys.version_info[0] < 3:
        # https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Nuri%20ACAR
        python3_ascii_attention = """
 █████╗ ████████╗████████╗███████╗███╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗██╗
██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝████╗  ██║╚══██╔══╝██║██╔═══██╗████╗  ██║██║
███████║   ██║      ██║   █████╗  ██╔██╗ ██║   ██║   ██║██║   ██║██╔██╗ ██║██║
██╔══██║   ██║      ██║   ██╔══╝  ██║╚██╗██║   ██║   ██║██║   ██║██║╚██╗██║╚═╝
██║  ██║   ██║      ██║   ███████╗██║ ╚████║   ██║   ██║╚██████╔╝██║ ╚████║██╗
╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝

Run with Python3! See you soon...
"""
        clear_screen()
        print(python3_ascii_attention)
    else:
        main()
