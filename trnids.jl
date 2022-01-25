###############################################################################
###############################################################################
###############################################################################
## TRNIDS: TR National Identifier Suite
###############################################################################






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
        print("[ 99. Exit ]")
        prnt_seperator()
        prnt_terminated()
        return false # while loop breaker in main.
    elseif selected_option == 1
        clear_screen()
        print("[ 1. Check NID Validation ]")
        prnt_seperator()
        ctrl_nid_validation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 2
        clear_screen()
        print("[ 2. Generate Last Two Digits ]")
        prnt_seperator()
        ctrl_nid_root_to_nid_generation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 3
        clear_screen()
        print("[ 3. NID Whois ]")
        prnt_seperator()
        ctrl_nid_whois()
        prnt_hit_enter_to_continue()
    elseif selected_option == 4
        clear_screen()
        print("[ 4. Get Possible Relatives ]")
        prnt_seperator()
        ctrl_possible_relatives_generation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 5
        clear_screen()
        print("[ 5. Generate Random Valid NID ]")
        prnt_seperator()
        ctrl_gnrt_prnt_random_valid_nid()
        prnt_hit_enter_to_continue()
    elseif selected_option == 6
        clear_screen()
        print("[ 6. Generate All Possible NID's ]")
        prnt_seperator()
        ctrl_nidspace_generation()
        prnt_hit_enter_to_continue()
    elseif selected_option == 98
        clear_screen()
        print("[ 98. About & Source Code Repository & Version History ]")
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
        Base.run("cls")
    elseif Sys.islinux() || Sys.isapple()
        Base.run(`clear`)
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
    input("\nHit 'Enter' to continue to menu!")
    clear_screen()
end

###############################################################################

function prnt_newline()
    println("")
end

###############################################################################

function prnt_terminated()
    println("\nTerminated!\n") # Double newline! First one is in println() fn!
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
    println("\n", improper_nid_root_entry_alert)
end

###############################################################################

function prnt_improper_nid_entry()
    improper_nid_entry_alert = """Improper NID Entry!
NID contains 11 digits! Also, first digit can not be 0!
Please type like this: 12345678901"""
    println("\n", improper_nid_entry_alert)
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
        data_to_history_file = "$valid_nid <<<<< $(get_date_time())\n\n[ Seniors ]\n\n"
        wrt_data_history(data_to_history_file)

        println("[ 1. Seniors ]")
        prnt_seperator()
    elseif header_option == 2
        data_to_history_file = "$valid_nid <<<<< $(get_date_time())\n\n[ Juniors ]\n\n"
        wrt_data_history(data_to_history_file)

        println("[ 2. Juniors ]")
        prnt_seperator()
    elseif header_option == 3
        data_to_history_file = "$valid_nid <<<<< $(get_date_time())\n\n[ Seniors & Juniors ]\n\n"
        wrt_data_history(data_to_history_file)

        println("[ 3. Seniors & Juniors ]")
        prnt_seperator()
    else
        data_to_history_file = "$valid_nid <<<<< $(get_date_time())\n\n[ Seniors & Juniors ]\n\n"
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
        write(io, data)
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
        data_to_history_file = "$valid_nid <<<<< $(get_date_time())\nNID Valid!\n\n"
        wrt_data_history(data_to_history_file)

        prnt_nid_is_valid()
    else
        data_to_history_file = "$valid_nid <<<<< $(get_date_time())\n         ^^---- + The valid NID is this! [Wrong Entry]\n\n"
        wrt_data_history(data_to_history_file)

        prnt_nid_is_not_valid()
        println("\n$valid_nid")
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

function main()
    while true
        main_menu()

        if swtch_main_menu_option() == false # 99 Menu Exit.
            break
        end

        # readline()
    end
end

###############################################################################
# https://docs.julialang.org/en/v1/manual/faq/#How-do-I-check-if-the-current-file-is-being-run-as-the-main-script?
 
if abspath(PROGRAM_FILE) == @__FILE__
    # Note:
    # Assigning a macro value to variable:
    # https://discourse.julialang.org/t/assigning-a-macro-to-a-variable/3773
    # @eval const $(Symbol("@duration")) = $(Symbol("@time"))
    @time main()
end
