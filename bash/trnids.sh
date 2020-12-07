#!/bin/bash

###############################################################################
# About Program

function fnAboutProgram {
    
    # WIP Logs :
    # ==========
    # 20190417 : Start

    # 20190423085333 : v0.1
    # 20190424180421 : v0.2 : C generator added
    # 20190425010841 : v0.2.1 : Elapsed time function fix.
    # 20200331185845 : v0.2.2 : Alert text correction.

    fnSeperatorPrinter

    printf "TRNIDS: TR National Identifier Suite [v0.2.2 : 20200331185845]\n"

    fnSeperatorPrinter

cat << EOF
Attention!

This program depends on Crunch WL Generator and GNU tar!
https://sourceforge.net/projects/crunch-wordlist/
https://www.gnu.org/software/tar/

EOF
}

###############################################################################
# Menu

function fnMenu {
cat << EOF
[ Menu ]
=========================================
0. Exit
1. Check NID Validation
2. Generate Last Two Digits
3. NID Whois
4. Get Possible Relatives
5. Generate Random Valid NID
6. Generate All Possible NID's
=========================================

EOF
    fnOptionSwitch
}

###############################################################################
# Option Switch

function fnOptionSwitch {
    read -n 1 -p "Select an Option: " option

    case $option in
        0)
            fnScreenCleaner
            printf "[ 0. Exit ]\n"
            fnSeperatorPrinter
            printf "Terminated!\n\n"
            ;;
        1)
            fnScreenCleaner
            printf "[ 1. Check NID Validation ]\n"
            fnSeperatorPrinter
            fnCheckNidValidation
            fnDonePrinter
            fnAboutProgram
            fnMenu
            ;;
        2)
            fnScreenCleaner
            printf "[ 2. Generate Last Two Digits ]\n"
            fnSeperatorPrinter
            fnLast2DigitsGenerator
            fnDonePrinter
            fnAboutProgram
            fnMenu
            ;;
        3)
            fnScreenCleaner
            printf "[ 3. NID Whois ]\n"
            fnSeperatorPrinter
            fnNidWhois
            fnDonePrinter
            fnAboutProgram
            fnMenu
            ;;
        4)
            fnScreenCleaner
            printf "[ 4. Get Possible Relatives ]\n"
            fnSeperatorPrinter
            fnPossibleRelativesGenerator
            fnAboutProgram
            fnMenu
            ;;
        5)
            fnScreenCleaner
            printf "[ 5. Generate Random Valid NID ]\n"
            fnSeperatorPrinter
            fnRandomValidNidGenerator
            fnDonePrinter
            fnAboutProgram
            fnMenu
            ;;
        6)
            fnScreenCleaner
            printf "[ 6. Generate All Possible NID's ]\n"
            fnSeperatorPrinter
            fnAllPossibleNidsGenerator
            fnDonePrinter
            fnAboutProgram
            fnMenu
            ;;
        *)
            fnOutOfOptionPrinter
            fnAboutProgram
            fnMenu
            ;;
    esac
}

###############################################################################
# ScreenCleaner

function fnScreenCleaner {
    printf "\033c" # clear screen(ctrl + l)
}

###############################################################################
# Seperator Printer

function fnSeperatorPrinter {
    for i in {1..79}
    do
        printf "=" # Seperator Printout
    done
    
    printf "\n"
}

###############################################################################
# "Done" Printer

function fnDonePrinter {
    read -n 1 -p "Done! ====> Hit a key to continue to menu!"
    fnScreenCleaner
}

###############################################################################
# "Out of Numeric" Printer

function fnOutOfNumericPrinter {
    fnScreenCleaner
    printf "[ Attention! ]\n"
    fnSeperatorPrinter
    read -n 1 -p "Entry contains letter! It must be numeric!"
    fnScreenCleaner
}

###############################################################################
# "Out of Option" Printer

function fnOutOfOptionPrinter {
    fnScreenCleaner
    printf "[ Attention! ]\n"
    fnSeperatorPrinter
    read -n 1 -p "Out of Option! Hit a key to continue to menu!"
    fnScreenCleaner
}

###############################################################################
# Get Time

function fnGetTime {
    SECONDS=0 # gets time now for elapsed time calculation
}

###############################################################################
# Elapsed Time Calculator

function fnElapsedTimeCalculator {

    duration=$SECONDS # gets duration time from SECONDS=0 till now
    
    hours=$(( $duration / 3600 ))
    minutes=$(( ( $duration / 60 ) % 60 ))
    seconds=$(( $duration % 60 ))
    
    fnSeperatorPrinter

    if [ "$hours" -gt 0 ]; then
       printf "Done! ====> $hours h. $minutes m. $seconds s.\n"
    elif [ "$minutes" -gt 0 ]; then
       printf "Done! ====> $minutes m. $seconds s.\n"
    else
       printf "Done! ====> $seconds s.\n"
    fi

    fnSeperatorPrinter
}

###############################################################################
# 0 to 9 Random Number Generator (... for digit 2 to 9)

function fn0to9RandomNumberGenerator() {
    random_number=$(( ( RANDOM % 10 ) ))
    echo $random_number 
}

###############################################################################
# 1 to 9 Random Number Generator (.. for only digit 1)

function fn1to9RandomNumberGenerator() {
    random_number=$(( ( RANDOM % 9 )  + 1 ))
    echo $random_number 
}

###############################################################################
# NID Validation Checker

function fnCheckNidValidation {
    read -n 11 -p "Type 11 digits NID: " nid_entry
    printf "\n\n"
    is_valid=(0 0 0 0 0 0 0 0 0 0 0)
    digits=(0 0 0 0 0 0 0 0 0)
    
    # converts string to array
    for (( i=0; i < ${#is_valid[*]}; i++ )) {
        is_valid[$i]=${nid_entry:i:1}
        digits[$i]=${nid_entry:i:1}
    }
    
    digits_0=${digits[0]}
    
    # first digit can not be 0.
    if [[ $digits_0 -eq 0 ]]
    then
        printf "Attention!\n\n"
        printf "%s" ${digits[*]}
        printf "\n"
        printf "^-------------- + First digit can not be equal 0!\n\n"
    else
        odd_digits_sum=0
        even_digits_sum=0

        odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                           digits[6] + digits[8] ))

        even_digits_sum=$(( digits[1] + digits[3] + digits[5] + digits[7] ))
        
        digits[9]=$(( ( $odd_digits_sum * 7 - $even_digits_sum ) % 10 ))
        # code below, if digit negative, converts positive (absolute value)
        digits[9]=$( echo ${digits[9]} | tr -d - )
        digits[10]=$(( ($odd_digits_sum + $even_digits_sum + digits[9]) % 10 ))
        # code below, if digit negative, converts positive (absolute value)
        digits[10]=$( echo ${digits[10]} | tr -d - )

        digits_9=${digits[9]}
        is_valid_9=${is_valid[9]}
        
        digits_10=${digits[10]}
        is_valid_10=${is_valid[10]}

        if [[ $digits_9 -eq $is_valid_9 && $digits_10 -eq $is_valid_10 ]]
        then
            printf "NID Valid!"
            printf "\n\n"
        else
            printf "NID NOT Valid!\n\n"
            printf "%s" ${digits[*]}
            printf "\n"
            printf "         ^^---- + The valid generic is this!\n\n"
        fi
    fi
}

###############################################################################
# NID Whois

function fnNidWhois {
    printf "This function not exist for now!\n\n"
}

###############################################################################
# Last 2 Digits Generator

function fnLast2DigitsGenerator {
    read -n 9 -p "Type first 9 digits of NID: " nid_entry
    printf "\n\n"
    is_valid=(0 0 0 0 0 0 0 0 0 0 0)
    digits=(0 0 0 0 0 0 0 0 0)
    
    # converts string to array
    for (( i=0; i < ${#is_valid[*]}; i++ )) {
        is_valid[$i]=${nid_entry:i:1}
        digits[$i]=${nid_entry:i:1}
    }
    
    digits_0=${digits[0]}

    # first digit can not be 0.
    if [[ $digits_0 -eq 0 ]]
    then
        printf "Attention!\n\n"
        printf "%s" ${digits[*]}
        printf "\n"
        printf "^-------------- + First digit can not be equal 0!\n\n"
    else
        odd_digits_sum=0
        even_digits_sum=0

        odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                           digits[6] + digits[8] ))

        even_digits_sum=$(( digits[1] + digits[3] + digits[5] + digits[7] ))

        digits[9]=$(( ( $odd_digits_sum * 7 - $even_digits_sum ) % 10 ))
        # code below, if digit negative, converts positive (absolute value)
        digits[9]=$( echo ${digits[9]} | tr -d - )
        digits[10]=$(( ($odd_digits_sum + $even_digits_sum + digits[9]) % 10 ))
        # code below, if digit negative, converts positive (absolute value)
        digits[10]=$( echo ${digits[10]} | tr -d - )
        
        printf "%s" ${digits[*]}
        printf "\n"
        printf "         ^^---- + Last two digits are here!\n\n"
    fi
}

###############################################################################
# Possible Relatives Generator

function fnPossibleRelativesGenerator {
    read -n 9 -p "Type first 9 digits of NID: " nid_entry
    printf "\n\n"
    is_valid=(0 0 0 0 0 0 0 0 0 0 0)
    digits=(0 0 0 0 0 0 0 0 0)
    
    relative_count=0
    relative_count_backup=0
    senior_or_and_junior=0
    senior=(0 0 0 0 0 0 0 0 0)
    person=(0 0 0 0 0 0 0 0 0)
    junior=(0 0 0 0 0 0 0 0 0)
    
    # converts string to array
    for (( i=0; i < ${#is_valid[*]}; i++ )) {
        is_valid[$i]=${nid_entry:i:1}
        digits[$i]=${nid_entry:i:1}
    }
    
    digits_0=${digits[0]}

    # first digit can not be 0.
    if [[ $digits_0 -eq 0 ]]
    then
        printf "\n"
        printf "Attention!\n\n"
        printf "%s" ${digits[*]}
        printf "\n"
        printf "^-------------- + First digit can not be 0!\n\n"
        fnDonePrinter
    else
        read -p "Type Relative Count: " relative_count
        relative_count_backup=$relative_count
        
        if [[ -n ${relative_count//[0-9]/} ]]; then
            fnOutOfNumericPrinter
        else
cat << EOF

[ Relative Type Selection ]
=========================================
1. Senior
2. Junior
3. Senior and Junior
=========================================            

EOF
            read -n 1 -p "Select: " senior_or_and_junior        
            
            case $senior_or_and_junior in
                1)
                    fnScreenCleaner
                    printf "[ 1. Seniors ]\n"
                    fnSeperatorPrinter

                    ###########################################################
                    # nid_entry has been assigned into digits above.
                    # calculates the person nid.
                    odd_digits_sum=0
                    even_digits_sum=0

                    odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                                       digits[6] + digits[8] ))

                    even_digits_sum=$(( digits[1] + digits[3] + 
                                        digits[5] + digits[7] ))
                    
                    digits[9]=$(( ( $odd_digits_sum * 7 - 
                    $even_digits_sum ) % 10 ))
                    # code below, if digit negative, 
                    # converts positive (absolute value)
                    digits[9]=$( echo ${digits[9]} | tr -d - )
                    digits[10]=$(( ($odd_digits_sum + 
                    $even_digits_sum + digits[9]) % 10 ))
                    # code below, if digit negative, 
                    #converts positive (absolute value)
                    digits[10]=$( echo ${digits[10]} | tr -d - )

                    # copies calculated digits to person
                    for (( i=0; i<${#digits[*]}; i++ )) {
                        person[$i]=${digits[$i]}
                    }

                    ###########################################################
                    # senior calculation loop

                    senior_nid=0
                    # relative factor number is here : 29999
                    senior_nid=$(( nid_entry + ( relative_count * 29999 ) ))
                    
                    # if nid base < 100000000 or nid base > 999999999
                    # calculations going to wrong. this is the fix.
                    if [[ senior_nid -gt 1000000000 ]]; then
                        senior_nid=$(( 100000000 + 
                        (senior_nid % 1000000000) ))
                    fi
                    
                    # do relative_count times
                    for (( n=0; n<relative_count; n++)) {
                        # assigns new generated senior nid to digits for calc.
                        for (( j=0; j < ${#is_valid[*]}; j++ )) {
                            digits[$j]=${senior_nid:j:1}
                        }
                        
                        # calculates last two digits of senior
                        odd_digits_sum=0
                        even_digits_sum=0

                        odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                                           digits[6] + digits[8] ))

                        even_digits_sum=$(( digits[1] + digits[3] + 
                                            digits[5] + digits[7] ))
                        
                        digits[9]=$(( ( $odd_digits_sum * 7 - 
                        $even_digits_sum ) % 10 ))
                        # code below, if digit negative, 
                        # converts positive (absolute value)
                        digits[9]=$( echo ${digits[9]} | tr -d - )
                        digits[10]=$(( ($odd_digits_sum + 
                        $even_digits_sum + digits[9]) % 10 ))
                        # code below, if digit negative, 
                        #converts positive (absolute value)
                        digits[10]=$( echo ${digits[10]} | tr -d - )
                        # copies calculated digits to senior
                        
                        for (( k=0; k<${#digits[*]}; k++ )) {
                            senior[$k]=${digits[$k]}
                        }
                       
                        printf "%3s. " $(( n + 1 ))
                        printf "%s" ${senior[*]}
                        printf "\n"

                        # assigns senior_nid to next younger senior
                        senior_nid=$(( senior_nid - 29999 ))
                        
                        # if nid base < 100000000 or nid base > 999999999
                        # calculations going to wrong. this is the fix.
                        if [[ senior_nid -gt 1000000000 ]]; then
                            senior_nid=$(( 100000000 + 
                            (senior_nid % 1000000000) ))
                        fi
                    }

                    # prints person
                    printf "\n===> "
                    printf "%s" ${person[*]}
                    printf "\n\n"
                    
                    ###########################################################
                    
                    fnDonePrinter
                    ;;
                2)
                    fnScreenCleaner
                    printf "[ 2. Juniors ]\n"
                    fnSeperatorPrinter

                    ###########################################################
                    # nid_entry has been assigned into digits above.
                    # calculates the person nid.
                    odd_digits_sum=0
                    even_digits_sum=0

                    odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                                       digits[6] + digits[8] ))

                    even_digits_sum=$(( digits[1] + digits[3] + 
                                        digits[5] + digits[7] ))
                    
                    digits[9]=$(( ( $odd_digits_sum * 7 - 
                                    $even_digits_sum ) % 10 ))
                    
                    digits[10]=$(( ( $odd_digits_sum + $even_digits_sum + 
                                     digits[9] ) % 10 ))

                    # copies calculated digits to person
                    for (( i=0; i<${#digits[*]}; i++ )) {
                        person[$i]=${digits[$i]}
                    }

                    # prints person
                    printf "\n===> "
                    printf "%s" ${person[*]}
                    printf "\n\n"
                    
                    ###########################################################
                    # junior calculation loop

                    junior_nid=0
                    # relative factor number is here : 29999
                    junior_nid=$(( nid_entry - 29999 ))
                    
                    # if nid base < 100000000 or nid base > 999999999
                    # calculations going to wrong. this is the fix.
                    if [[ junior_nid -lt 100000000 ]]; then
                        junior_nid=$(( junior_nid + 900000000 ))
                    fi
                    
                    # do relative_count times
                    for (( n=0; n<relative_count; n++)) {
                        # assigns new generated senir nid to digits for calc.
                        for (( j=0; j < ${#is_valid[*]}; j++ )) {
                            digits[$j]=${junior_nid:j:1}
                        }
                        
                        # calculates last two digits of senior
                        odd_digits_sum=0
                        even_digits_sum=0

                        odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                                           digits[6] + digits[8] ))

                        even_digits_sum=$(( digits[1] + digits[3] + 
                                            digits[5] + digits[7] ))
                        
                        digits[9]=$(( ( $odd_digits_sum * 7 - 
                        $even_digits_sum ) % 10 ))
                        # code below, if digit negative, 
                        # converts positive (absolute value)
                        digits[9]=$( echo ${digits[9]} | tr -d - )
                        digits[10]=$(( ($odd_digits_sum + 
                        $even_digits_sum + digits[9]) % 10 ))
                        # code below, if digit negative, 
                        #converts positive (absolute value)
                        digits[10]=$( echo ${digits[10]} | tr -d - )
                        
                        # copies calculated digits to junior
                        for (( k=0; k<${#digits[*]}; k++ )) {
                            junior[$k]=${digits[$k]}
                        }
                       
                        printf "%3s. " $(( n + 1 ))
                        printf "%s" ${junior[*]}
                        printf "\n"

                        # assigns junior_nid to next younger senior
                        junior_nid=$(( junior_nid - 29999 ))
                        
                        # if nid base < 100000000 or nid base > 999999999
                        # calculations going to wrong. this is the fix.
                        if [[ junior_nid -lt 100000000 ]]; then
                            junior_nid=$(( junior_nid + 900000000 ))
                        fi
                        
                    }
                    
                    printf "\n"
                    
                    ###########################################################

                    fnDonePrinter
                    ;;
                3)
                    fnScreenCleaner
                    printf "[ 3. Seniors and Juniors ]\n"
                    fnSeperatorPrinter

                    ###########################################################
                    # nid_entry has been assigned into digits above.
                    # calculates the person nid.
                    odd_digits_sum=0
                    even_digits_sum=0

                    odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                                       digits[6] + digits[8] ))

                    even_digits_sum=$(( digits[1] + digits[3] + 
                                        digits[5] + digits[7] ))
                    
                    digits[9]=$(( ( $odd_digits_sum * 7 - 
                    $even_digits_sum ) % 10 ))
                    # code below, if digit negative, 
                    # converts positive (absolute value)
                    digits[9]=$( echo ${digits[9]} | tr -d - )
                    digits[10]=$(( ($odd_digits_sum + 
                    $even_digits_sum + digits[9]) % 10 ))
                    # code below, if digit negative, 
                    #converts positive (absolute value)
                    digits[10]=$( echo ${digits[10]} | tr -d - )
                    
                    # copies calculated digits to person
                    for (( i=0; i<${#digits[*]}; i++ )) {
                        person[$i]=${digits[$i]}
                    }

                    ###########################################################
                    # senior calculation loop

                    senior_nid=0
                    # relative factor number is here : 29999
                    senior_nid=$(( nid_entry + ( relative_count * 29999 ) ))
                    
                    # if nid base < 100000000 or nid base > 999999999
                    # calculations going to wrong. this is the fix.
                    if [[ senior_nid -gt 1000000000 ]]; then
                        senior_nid=$(( 100000000 + 
                        (senior_nid % 1000000000) ))
                    fi
                    
                    # do relative_count times
                    for (( n=0; n<relative_count; n++)) {
                        # assigns new generated senir nid to digits for calc.
                        for (( j=0; j < ${#is_valid[*]}; j++ )) {
                            digits[$j]=${senior_nid:j:1}
                        }
                        
                        # calculates last two digits of senior
                        odd_digits_sum=0
                        even_digits_sum=0

                        odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                                           digits[6] + digits[8] ))

                        even_digits_sum=$(( digits[1] + digits[3] + 
                                            digits[5] + digits[7] ))
                        
                        digits[9]=$(( ( $odd_digits_sum * 7 - 
                        $even_digits_sum ) % 10 ))
                        # code below, if digit negative, 
                        # converts positive (absolute value)
                        digits[9]=$( echo ${digits[9]} | tr -d - )
                        digits[10]=$(( ($odd_digits_sum + 
                        $even_digits_sum + digits[9]) % 10 ))
                        # code below, if digit negative, 
                        #converts positive (absolute value)
                        digits[10]=$( echo ${digits[10]} | tr -d - )
                        
                        # copies calculated digits to senior
                        for (( k=0; k<${#digits[*]}; k++ )) {
                            senior[$k]=${digits[$k]}
                        }
                       
                        printf "%3s. " $(( n + 1 ))
                        printf "%s" ${senior[*]}
                        printf "\n"

                        # assigns senior_nid to next younger senior
                        senior_nid=$(( senior_nid - 29999 ))
                        
                        # if nid base < 100000000 or nid base > 999999999
                        # calculations going to wrong. this is the fix.
                        if [[ senior_nid -gt 1000000000 ]]; then
                            senior_nid=$(( 100000000 + 
                            (senior_nid % 1000000000) ))
                        fi
                        
                    }

                    # prints person
                    printf "\n===> "
                    printf "%s" ${person[*]}
                    printf "\n\n"
                    
                    ###########################################################
                    
                    ###########################################################
                    # junior calculation loop

                    junior_nid=0
                    # relative factor number is here : 29999
                    junior_nid=$(( nid_entry - 29999 ))
                    
                    # if nid base < 100000000 or nid base > 999999999
                    # calculations going to wrong. this is the fix.
                    if [[ junior_nid -lt 100000000 ]]; then
                        junior_nid=$(( junior_nid + 900000000 ))
                    fi
                    
                    # do relative_count times
                    for (( n=0; n<relative_count; n++)) {
                        # assigns new generated senir nid to digits for calc.
                        for (( j=0; j < ${#is_valid[*]}; j++ )) {
                            digits[$j]=${junior_nid:j:1}
                        }
                        
                        # calculates last two digits of senior
                        odd_digits_sum=0
                        even_digits_sum=0

                        odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                                           digits[6] + digits[8] ))

                        even_digits_sum=$(( digits[1] + digits[3] + 
                                            digits[5] + digits[7] ))
                        
                        digits[9]=$(( ( $odd_digits_sum * 7 - 
                        $even_digits_sum ) % 10 ))
                        # code below, if digit negative, 
                        # converts positive (absolute value)
                        digits[9]=$( echo ${digits[9]} | tr -d - )
                        digits[10]=$(( ($odd_digits_sum + 
                        $even_digits_sum + digits[9]) % 10 ))
                        # code below, if digit negative, 
                        #converts positive (absolute value)
                        digits[10]=$( echo ${digits[10]} | tr -d - )

                        # copies calculated digits to junior
                        for (( k=0; k<${#digits[*]}; k++ )) {
                            junior[$k]=${digits[$k]}
                        }
                       
                        printf "%3s. " $(( n + 1 ))
                        printf "%s" ${junior[*]}
                        printf "\n"

                        # assigns junior_nid to next younger senior
                        junior_nid=$(( junior_nid - 29999 ))
                        
                        # if nid base < 100000000 or nid base > 999999999
                        # calculations going to wrong. this is the fix.
                        if [[ junior_nid -lt 100000000 ]]; then
                            junior_nid=$(( junior_nid + 900000000 ))
                        fi
                    }
                    
                    printf "\n"
                    fnDonePrinter
                    ;;
                *)
                    fnOutOfOptionPrinter
                    ;;
            esac
        fi
    fi
}

###############################################################################
# Random Valid NID Generator

function fnRandomValidNidGenerator {
    # NID root has only 9 digits. 10th and 11th digits generates from root.
    rand_valid_nid_root=(0 0 0 0 0 0 0 0 0)

    # 1st digit must be 1 to 9. (0 not accepted at 1st digit)
    random_number=$(fn1to9RandomNumberGenerator)
    rand_valid_nid_root[0]=$random_number

    # 2 to 9 digits can be 0 to 9.
    for i in {1..8}
    do
        random_number=$(fn0to9RandomNumberGenerator)
        rand_valid_nid_root[$i]=$random_number
    done
    
    generated_nid=(0 0 0 0 0 0 0 0 0 0 0)
    digits=(0 0 0 0 0 0 0 0 0)
    # copies array to another and saves already generated first 9 digits
    for (( i=0; i<${#rand_valid_nid_root[*]}; i++)) {
        generated_nid[$i]=${rand_valid_nid_root[$i]}
        digits[$i]=${rand_valid_nid_root[$i]}
    }

    odd_digits_sum=0
    even_digits_sum=0

    odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                       digits[6] + digits[8] ))

    even_digits_sum=$(( digits[1] + digits[3] + digits[5] + digits[7] ))
    
    digits[9]=$(( ( $odd_digits_sum * 7 - $even_digits_sum ) % 10 ))
    # code below, if digit negative, converts positive (absolute value)
    digits[9]=$( echo ${digits[9]} | tr -d - )
    digits[10]=$(( ($odd_digits_sum + $even_digits_sum + digits[9]) % 10 ))
    # code below, if digit negative, converts positive (absolute value)
    digits[10]=$( echo ${digits[10]} | tr -d - )

    for (( i=9; i<${#digits[*]}; i++ )) {
        generated_nid[$i]=${digits[$i]}
    }
    
    printf "%s" ${generated_nid[*]}
    printf "\n\n"
}

###############################################################################
# All Possible NID's Generator

function fnAllPossibleNidsGenerator {
    
    ##### Step 1: Start ==> Sequence Generation

    # sequence generation for become row numbers(nth nid).
cat << EOF
Step 1: Start ==> Sequence Generation

==========> Generating: Sequence [1]

EOF

    # 1..99999999 sequence number generator C source code.
    # could't make it with crunch, so wrote code below.
cat << 'EOF' > sequence_generator.c
#include <stdio.h>
#include <stdlib.h> /* for exit() function */
#include <time.h>

int main(void)
{
    clock_t timeStart = clock(); /* execution time calculation */
    
    static char szWriteFile[10];
    sprintf(szWriteFile, "1.seq.txt");
    FILE *fpWriteFile = fopen(szWriteFile, "a");

    for(int loop = 1; loop <= 99999999; loop++)
    {
        fprintf(fpWriteFile, "%d\n", loop);
    }
    
    fclose(fpWriteFile);
    
    clock_t timeEnd = clock();
    double timeSpent = (double)(timeEnd - timeStart) / CLOCKS_PER_SEC;
        
    printf("Done generating output. (%.3f s.)\n", timeSpent);
    
    return 0;
}
EOF
    # gcc compiles executable
    gcc -Wall -o sequence_generator sequence_generator.c

    # after compiling, shreds.
    shred -zuvn 1 sequence_generator.c
    # if shred program does not exists, removes.
    rm sequence_generator.c

    # executes the sequence_generator
    ./sequence_generator
    
    # after executing, shreds.
    shred -zuvn 1 sequence_generator
    # if shred program does not exists, removes.
    rm sequence_generator

    # crunch generates 100000000..899999999 sequence into seperate files.
    for v in {1..8}
    do
        t=$(( v + 1 ))
        echo;
        echo "==========> Generating: Sequence [$t]";
        echo;

        crunch 9 9 0123456789 -t $v%%%%%%%% -o $t.seq.txt
    done

    echo;
    echo "Step 1: Done! ==> Sequence Generation";
    fnSeperatorPrinter;

    ##### Step 2: Start ==> Base Number Generation

cat << EOF
Step 2: Start ==> Base Number Generation
EOF
    for k in {1..9}
    do
        printf "\n==========> Generating: [$k]' s\n\n"                          
        # charset.lst must be in same folder with this sh.                      
        crunch 9 9 0123456789 -t $k%%%%%%%% -o $k.base.txt
    done 

    printf "\n"
    
    fnSeperatorPrinter

cat << EOF
Step 2: Done! ==> Base Number Generation

Attention!
Last two digits generator's source code will extract for compilation 
and will shred or remove after compilation!
EOF
    
    fnSeperatorPrinter

# =========================================================================
# Attention! This below, are in multiline comment!
# gen_from_file_to_file.sh is first and bash version of last two digit
# generator from file to file!

: <<'MULTI_LINE_COMMENT'    
    # writes code inside to a file
    cat << 'EOF' > gen_from_file_to_file.sh
#!/bin/bash
t=0
for t in {1..9}
do
    printf "\n==========> Generating: [$t]' s\n\n"
    input="./$t.base.txt"
    while IFS= read -r nid_entry
    do
        digits=(0 0 0 0 0 0 0 0 0)
        
        # converts string to array
        for (( a=0; a < 9; a++ )) {
            digits[$a]=${nid_entry:a:1}
        }
        
        odd_digits_sum=0
        even_digits_sum=0

        odd_digits_sum=$(( digits[0] + digits[2] + digits[4] + 
                           digits[6] + digits[8] ))

        even_digits_sum=$(( digits[1] + digits[3] + digits[5] + digits[7] ))

        digits[9]=$(( ( ( $odd_digits_sum * 7 ) - $even_digits_sum ) % 10 ))
        
        # code below, if digit negative, converts positive (absolute value)
        digits[9]=$( echo ${digits[9]} | tr -d - )
        
        digits[10]=$(( ( $odd_digits_sum + $even_digits_sum + 
                                                        digits[9] ) % 10 ))
        
        # code below, if digit negative, converts positive (absolute value)
        digits[10]=$( echo ${digits[10]} | tr -d - )
        
        printf "%s" ${digits[*]} >> $t.txt
        printf "\n" >> $t.txt

    done < "$input"
done
EOF
MULTI_LINE_COMMENT

# =========================================================================
# Attention! This below, are for c file generating!

# gen_from_file_to_file.sh is first and bash version of last two digit
# generator from file to file! But sh version of generator is tooooo slow!
# Thus generating takes over a week!

# ... so i recoded with C as below and elapsed time reduced to max. 20mins. :)

cat << 'EOF' > gen_from_file_to_file.c
#include <stdio.h>
#include <stdlib.h> /* for exit() function */
#include <time.h>
#include <ctype.h> /* for isdigit() function */

int main(void)
{
    for(int loop = 1; loop <= 9; loop++)
    {
        printf("========================================\
=======================================\n");
        printf("[ NID: %d' s ] Generating...\n", loop);
        
        clock_t timeStart = clock(); /* execution time calculation */

        static char szReadFile[11];
        static char szWriteFile[6];

        sprintf(szReadFile, "%d.base.txt", loop);
        sprintf(szWriteFile, "%d.txt", loop);

        FILE *fpReadFile = fopen(szReadFile, "r");
        FILE *fpWriteFile = fopen(szWriteFile, "a");
        
        if (fpReadFile != NULL) /* reads file to the end of file */
        {
            char line_input[11] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            while(fgets(line_input, 11, fpReadFile) != NULL) /* read a line */
            {
                int digits[11] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
                
                int x = 0;
                int y = 0;
                
                while(line_input[y] != '\0')
                {
                    if(isdigit(line_input[y]))
                    {
                        /* substracts `'0'` from your character's hex version
                         * and assigns new form to digit array.
                         * '30' = 0
                         * '31' = 1
                         * .. so on.
                         **/
                        digits[x++] = line_input[y++] - '0';
                        //count++;
                    }
                    else y++;
                }
                
                int odd_digits_sum = 0;
                int even_digits_sum = 0;

                odd_digits_sum = digits[0] + digits[2] 
                               + digits[4] + digits[6] + digits[8];
                
                even_digits_sum = digits[1] 
                                + digits[3] + digits[5] + digits[7];
                
                digits[9] = abs( (( odd_digits_sum * 7 ) - even_digits_sum ) 
                                    % 10 );
                
                digits[10] = abs( ( odd_digits_sum + even_digits_sum 
                                    + digits[9] ) % 10 );
                
                for(int v = 0; v < 11; v++)
                {
                    fprintf(fpWriteFile, "%d", digits[v]);
                }

                fprintf(fpWriteFile, "\n");
            }
            
            fclose(fpReadFile);
            fclose(fpWriteFile);
        }
        else
        {
            perror(szReadFile); /* why didn't the file open? */
        }
        
        clock_t timeEnd = clock();
        double timeSpent = (double)(timeEnd - timeStart) / CLOCKS_PER_SEC;

        printf("[ NID: %d' s ] Done! ==> ... in %.3f s.\n", loop, timeSpent);
        printf("========================================\
=======================================\n");
    }
    
    return 0;
}
EOF

    printf "\n"
    
    # =========================================================================
    # calls another script for generate last 2 digits of base numbers in a
    # file. 
    # Uncomment two line below when you want to use sh version of last two gen.
    
    #. gen_from_file_to_file.sh # calls generated sh script for gen.
    #rm gen_from_file_to_file.sh # removes extracted script file
    # =========================================================================

    # gcc compiles executable
    gcc -Wall -o generator gen_from_file_to_file.c 
    
    # after compiling, shreds.
    shred -zuvn 5 gen_from_file_to_file.c
    
    # if shred program does not exists, removes.
    rm gen_from_file_to_file.c
    
    printf "\n"
    
    fnSeperatorPrinter

cat << EOF
Step 3: Start ==> Last Two Digits Generation
EOF
    
    fnSeperatorPrinter
    
    # runs executable
    ./generator

    printf "\n"
    
    # after generating, shreds.
    shred -zuvn 5 generator
    # if shred program does not exists, removes.
    rm generator

    printf "\n"

    fnSeperatorPrinter

cat << EOF
Step 3: Done! ==> Last Two Digits Generation

Step 4: Start ==> Compress and Archive
EOF
    
    fnSeperatorPrinter

    printf "\n"
    
    for q in {1..9}
    do
        tar -cv --lzma -f $q.seq.txt.lzma $q.seq.txt
        tar -cv --lzma -f $q.base.txt.lzma $q.base.txt
        tar -cv --lzma -f $q.txt.lzma $q.txt
    done
    
    # compess done. time to make directory to move files.
    directory="nids"

    mkdir $directory
    mv *.seq.txt.lzma $directory
    mv *.base.txt.lzma $directory
    mv *.txt.lzma $directory
    mv *.seq.txt $directory
    mv *.base.txt $directory
    mv *.txt $directory
    
    printf "\n"

    fnSeperatorPrinter

cat << EOF
Step 4: Done! ==> Compress and Archive

[ Report ]

+ Generated
        + Sequence  : n.seq.txt
        + NID Base  : n.base.txt
        + NID       : n.txt
+ Compressed 
        + Sequence  : n.seq.txt.lzma
        + NID Base  : n.base.txt.lzma
        + NID       : n.txt.lzma

+ Archived          : ./nids/
EOF
    
    fnSeperatorPrinter

    printf "\n";
}

###############################################################################
# Main Function

function fnMain {
    fnScreenCleaner
    fnGetTime # for processes elapsed time calculation
    fnAboutProgram
    fnMenu
    fnElapsedTimeCalculator
}

fnMain

# END
###############################################################################
###############################################################################
