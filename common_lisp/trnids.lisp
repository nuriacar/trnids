;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRNID Suite

;; 20190417       : Start on bash.

;; 20190423085333 : V0.0.1
;; 20190424180421 : V0.0.2 : C generator add.
;; 20190425010841 : V0.0.3 : Elapsed time function fix.
;; 20200331161407 : start on Python3.
;; 20200405145247 : v0.0.4 : Ported to python3.
;; 20200405234321 : v0.0.5 : Pp. 16 : all nid gen. on win py func. add.
;; 20200406151747 : v0.0.6 : Keyboard Interrupt errors handled in main.
;; 20200411051239 : v0.0.6 : Program name edited.
;; 20200527004701 : Start on common lisp
;; 20200601160705 : v0.0.7 : Ported to common lisp.
;; 20200603003901 : v0.0.8 : Variable based compilation errors fix.
;; 20200603003901 : v0.0.8 : let, let*, defvar, defparameter.
;; 20200603003901 : v0.0.8 : Flow change.
;; 20200606201807 : v0.0.9 : History record. Flow change. Classify.
;; 20200730111939 : v0.0.9 : Lisp to Python3 port start.
;; 20200806135339 : v0.0.9 : Lisp to Python3 port done.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main Menu And Switch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-main-menu ()
  (let ((program-name "TRNID Suite")
        (program-version "v0.0.9:20200806135339")
        (program-menu "[ Menu ]
===============================================================================
+++ [ NID ] National Identifier Suite
.
... 1. Check NID Validation
... 2. Generate Last Two Digits
... 3. NID WHOIS
... 4. Get Possible Relatives
... 5. Generate Random Valid NID
... 6. Generate All Possible NID's


+++ 99. Exit
==============================================================================="))
    (fn-cln-screen)
    (fn-prnt-seperator)
    (format t "~a [~a]~%" program-name program-version)
    (fn-prnt-seperator)
    (format t "~%~a~%" program-menu)
    (fn-swtch-main-menu-option)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-swtch-main-menu-option ()
  (let ((selected-option 0))

    (format t "~%Select an Option!~%")

    (case (setf selected-option (fn-get-chck-positive-numeric))
      (99 (progn
             (fn-cln-screen)
             (fn-prnt-seperator)
             (format t "[ 99. Exit ]~%")
             (fn-prnt-seperator)
             (fn-prnt-terminated)))
      (1 (progn
            (fn-cln-screen)
            (format t "[ 1. Check NID Validation ]~%")
            (fn-prnt-seperator)
            (fn-ctrl-nid-validation)
            (fn-prnt-hit-enter-to-continue)
            (fn-prnt-main-menu)))
      (2 (progn
            (fn-cln-screen)
            (format t "[ 2. Generate Last Two Digits ]~%")
            (fn-prnt-seperator)
            (fn-ctrl-nid-root-to-nid-generation)
            (fn-prnt-hit-enter-to-continue)
            (fn-prnt-main-menu)))
      (3 (progn
            (fn-cln-screen)
            (format t "[ 3. NID WHOIS ]~%")
            (fn-prnt-seperator)
            (fn-ctrl-nid-whois)
            (fn-prnt-hit-enter-to-continue)
            (fn-prnt-main-menu)))
      (4 (progn
            (fn-cln-screen)
            (format t "[ 4. Get Possible Relatives ]~%")
            (fn-prnt-seperator)
            (fn-ctrl-possible-relatives-generation)
            (fn-prnt-hit-enter-to-continue)
            (fn-prnt-main-menu)))
      (5 (progn
            (fn-cln-screen)
            (format t "[ 5. Generate Random Valid NID ]~%")
            (fn-prnt-seperator)
            (fn-ctrl-gnrt-prnt-random-valid-nid)
            (fn-prnt-hit-enter-to-continue)
            (fn-prnt-main-menu)))
      (6 (progn
            (fn-cln-screen)
            (format t "[ 6. Generate All Possible NID's ]~%")
            (fn-prnt-seperator)
            (fn-ctrl-nidspace-generation)
            (fn-prnt-hit-enter-to-continue)
            (fn-prnt-main-menu)))
      (otherwise (progn
                   (fn-prnt-out-of-option)
                   (fn-prnt-hit-enter-to-continue)
                   (fn-prnt-main-menu))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Printers, Screen Cleaners
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-cln-screen () (format t "~A[H~@*~A[J" #\escape)); ANSI Style

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-seperator ()
  (progn
    (dotimes (i 79) (format t "="))
    (format t "~%")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-hit-enter-to-continue ()
  (progn
    (format t "~%Hit 'Enter' to continue to menu!")
    (read-char)
    (fn-cln-screen)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-newline () (format t "~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-terminated () (format t "Terminated!~%~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-out-of-option () (format t "~%Out of Option!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-default-option-assigned ()
  (format t "~%Out of Option! Default option assigned!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-developing-in-progress ()
  (format t "This option developing in progress for now!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-entry-must-be-numeric ()
  (format t "~%Entry must be numeric!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-improper-nid-root-entry ()
  (let ((improper-nid-root-entry-alert "Improper NID Root Entry!
NID root contains 9 digits! Also, first digit can not be 0!
Please type like this: 123456789"))
    (format t "~%~a~%~%" improper-nid-root-entry-alert)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-improper-nid-entry ()
  (let ((improper-nid-entry-alert "Improper NID Entry!
NID contains 11 digits! Also, first digit can not be 0!
Please type like this: 12345678901"))
    (format t "~%~a~%~%" improper-nid-entry-alert)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-nid-is-valid () (format t "~%NID is Valid!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-nid-is-not-valid () (format t "~%NID is NOT Valid!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-valid-nid-is-this ()
  (format t "         ^^---- + The valid NID is this!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-entry-must-be-positive-number ()
  (format t "~%Entry must be positive number!~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-prnt-senior-junior-both-heading
    (proper-nid-root-entry header-option)
  (let ((valid-nid (fn-gnrt-last-2-digits-of-nid proper-nid-root-entry)))
    (case header-option
      (1 (progn
           (fn-wrt-list-history
            (concatenate
             'list
             (vector
              (format nil "~d~a~a" valid-nid " <<<<< " (fn-get-date-time)))
             (vector "") (vector "[ Seniors ]")))
           
           (format t "[ 1. Seniors ]~%")
           (fn-prnt-seperator)))
      (2 (progn
           (fn-wrt-list-history
            (concatenate
             'list
             (vector
              (format nil "~d~a~a" valid-nid " <<<<< " (fn-get-date-time)))
             (vector "") (vector "[ Juniors ]")))
           
           (format t "[ 2. Juniors ]~%")
           (fn-prnt-seperator)))
      (3 (progn
           (fn-wrt-list-history
            (concatenate
             'list
             (vector
              (format nil "~d~a~a" valid-nid " <<<<< " (fn-get-date-time)))
             (vector "") (vector "[ Seniors & Juniors ]")))
           
           (format t "[ 3. Seniors & Juniors ]~%")
           (fn-prnt-seperator)))
      (otherwise
       (progn
         (fn-wrt-list-history
          (concatenate
           'list
           (vector
            (format nil "~d~a~a" valid-nid " <<<<< " (fn-get-date-time)))
           (vector "") (vector "[ Seniors & Juniors ]")))
         
         (format t "[ 3. Seniors & Juniors ]~%")
         (fn-prnt-seperator))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File Writers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-wrt-data-history (data)
  "Saves usage history. Writes data to file."
  (with-open-file (str "trnids-history"
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)
    (format str "~a~%" data)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-wrt-list-history (a-list)
  "Saves usage history. Writes list to file."
  (with-open-file (out "trnids-history"
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)
    (dolist (list-element a-list)
      (format out "~a~%" list-element))
    (format out "~%")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-wrt-data-file (filename data)
  "Writes data to file."
  (with-open-file (str filename
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)
    (format str "~a~%" data)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-wrt-list-file (filename a-list)
  "Writes list to file."
  (with-open-file (out filename
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)
    (dolist (list-element a-list)
      (format out "~a~%" list-element))
    (format out "~%")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Getters, Checkers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-get-chck-positive-numeric ()
  "Returns only positive number.
If entry not numeric, 0 or negative, calls itself till entry become positive."
  (let ((numeric-entry 0))

    (format t "~%>>> ")
    (setf numeric-entry (read)); ...reads user entry.
    (if (typep numeric-entry 'integer); If entry is integer,
        (if (> numeric-entry 0); and positive (must)...
            (return-from fn-get-chck-positive-numeric numeric-entry)
            (progn; Else, so not positive...
              (fn-prnt-entry-must-be-positive-number)
              (fn-get-chck-positive-numeric)))
        (progn; Else, so entry is not integer.
          (fn-prnt-entry-must-be-numeric)
          (fn-get-chck-positive-numeric)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-get-chck-nid ()
  "Gets proper NID and checks. If entry improper, calls itself till become OK."
  (let ((nid-entry 0)
        (str-nid-entry ""))

    (format t "Type All 11 Digits of NID~%")
    (setf str-nid-entry
          (fn-cnvrt-obj-to-str
           (setf nid-entry (fn-get-chck-positive-numeric))))

    (if (= (length str-nid-entry) 11)
        (return-from fn-get-chck-nid nid-entry)
        (progn
          (fn-prnt-improper-nid-entry)
          (fn-get-chck-nid)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-get-chck-nid-root ()
  "Gets proper NID Root and checks.
If entry improper, calls itself till become OK."
  (let ((nid-root-entry 0)
        (str-nid-root-entry ""))
    
    (format t "Type First 9 Digits of NID~%")
    (setf str-nid-root-entry
          (fn-cnvrt-obj-to-str
           (setf nid-root-entry (fn-get-chck-positive-numeric))))
    
    (if (= (length str-nid-root-entry) 9)
        (return-from fn-get-chck-nid-root nid-root-entry)
        (progn
          (fn-prnt-improper-nid-root-entry)
          (fn-get-chck-nid-root)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-chck-nid-validity (proper-nid-entry)
  "Calls fn-gnrt-last-2-digits-of-nid
to regenerate last two digits of entry for comparison."
  (let ((proper-nid-entry-root 0)
        (valid-nid 0))

    (setf valid-nid
          (fn-gnrt-last-2-digits-of-nid
           (;; Lets re-generate last two digits for comparison.
            ;; fn-gnrt-last-2-digits-of-nid accepts NID root
            ;; and NID root has 9 digits. Line below, cuts last two digits of
            ;; proper-nid-entry, then assigns to proper-nid-entry-root.
            setf proper-nid-entry-root (floor proper-nid-entry 100))))

    (if (= proper-nid-entry valid-nid)
        (progn
          (fn-wrt-list-history
           (concatenate
            'list
            (vector
             (format nil "~d~a~a" valid-nid " <<<<< " (fn-get-date-time)))
            (vector "NID Valid!")))
          
          (fn-prnt-nid-is-valid))
        (progn
          (fn-wrt-list-history
           (concatenate
            'list
            (vector
             (format nil "~d~a~a" valid-nid " <<<<< " (fn-get-date-time)))
            (vector "         ^^---- + The valid NID is this! [Wrong Entry]")))
          
          (fn-prnt-nid-is-not-valid)
          (format t "~%~a~%" valid-nid)
          (fn-prnt-valid-nid-is-this)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Converters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-cnvrt-obj-to-str (an-entry) (write-to-string an-entry))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-cnvrt-int-to-list (an-integer)
  (map 'list #'digit-char-p (prin1-to-string an-integer)))

;; Notes:
;; (map 'list #'digit-char-p (print1-to-string n)
;; (map 'list (lambda (c)(or (digit-char-p c) '-)) (prin1-to-string n))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-cnvrt-list-to-str (a-list)
  (format nil "~{~a~}" a-list))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-cnvrt-str-to-int (a-string)
  (parse-integer a-string))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Generators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-random-number (location)
  (case location
    (without-zero (+ 1 (random 9)))
    (normal (random 10))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-last-2-digits-of-nid (proper-nid-root)
  "Generates last two digits from NID root."
  (let ((digits-list-for-calc '())
        (odd-digits-sum 0)
        (even-digits-sum 0)
        (10th-digit 0)
        (11th-digit 0))

    ;; Line below, converts integer to list,
    ;; then assigns to a list variable for calculations.
    (setf digits-list-for-calc (fn-cnvrt-int-to-list proper-nid-root))

    ;; Now, all clear. This is the NID algorithm:
    ;; NID Root has only 9 digits. 10th and 11th digits generates from root.
    ;; abs(((odd_digits_sum * 7) - (even_digits_sum)) % 10) = 10th digit.
    ;; Now we have first 10 digits.
    ;; Sum of first 10 digits % 10 = 11th digit.
    ;; Done.

    ;; Gets and sets odd nth digits sum.
    (setf odd-digits-sum
          (fn-sum-numeric-list-elements
           (fn-gnrt-list-odd-nth-elements-of-list digits-list-for-calc)))
    
    ;; Gets and sets even nth digits sum.
    (setf even-digits-sum
          (fn-sum-numeric-list-elements
           (fn-gnrt-list-even-nth-elements-of-list digits-list-for-calc)))

    ;; Sometimes, NID 10th element calculation returns with negative number.
    ;; (abs n) gets absolute value of result. There is a weird situation in
    ;; python version! abs(-n % m) != (abs(-n)) % m. Check python negative
    ;; modulo on web. So, good approach is get abs value first, then modulo!
    (setf 10th-digit
          (rem (abs (- (* odd-digits-sum 7) even-digits-sum)) 10))

    ;; Time to add 10th-digit to digits-list-for-calc's 10th location.
    (setf digits-list-for-calc
          (append digits-list-for-calc (list 10th-digit)))

    ;; Time to calculate 11th-digit.
    (setf 11th-digit
          (rem (+ odd-digits-sum even-digits-sum 10th-digit) 10))

    ;; Time to add 11th-digit to digits-list-for-calc's 11th location.
    (setf digits-list-for-calc
          (append digits-list-for-calc (list 11th-digit)))

    (fn-cnvrt-str-to-int (fn-cnvrt-list-to-str digits-list-for-calc))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-list-odd-nth-elements-of-list (a-list)
  "Gets odd nth elements of list and makes new list with them."
  (return-from fn-gnrt-list-odd-nth-elements-of-list
    (do ((temp-list a-list (cddr temp-list))
         (new-list '() (cons (car temp-list) new-list)))
        ((null temp-list)
         (nreverse new-list)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-list-even-nth-elements-of-list (a-list)
  "Gets even nth elements of list and makes new list with them."
  (return-from fn-gnrt-list-even-nth-elements-of-list
    (do ((temp-list a-list (cddr temp-list))
         (new-list '() (cons (cadr temp-list) new-list)))
        ((null temp-list)
         (if (eq (car new-list) nil)
             (nreverse (cdr new-list))
             (nreverse new-list))))))

;; Notes:
;; (fn-gnrt-list-even-nth-elements-of-list '(1 2 3 4 5 6 7 8 9 0 1))
;; (2 4 6 8 0 NIL)

;; Because of odd number of elements lists, last element become NIL.
;; So, before reversing list, if first element equal NIL, get rest.
;; Then reverse the new list.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-prnt-senior (proper-nid-root-entry relative-count)
  "Gets proper-nid-root-entry and relative-count, processes and prints."
  (let* (;; Relative factor number is: 29999
         (senior-nid-root (+ proper-nid-root-entry (* relative-count 29999)))
         (inrange-senior-nid-root senior-nid-root)
         (calculated-senior-nid 0))
    
    ;; If senior-nid-root < 100000000 or > 999999999,
    ;; calculations going to wrong couse of nid system root range.
    ;; NID root must be 9 digits.

    ;; This is the fix:
    (if (> senior-nid-root 1000000000)
        (setf inrange-senior-nid-root
              (+ (rem senior-nid-root 1000000000) 100000000)))

    ;; Do relative-count times:
    (dotimes (n relative-count)
      (progn
        ;; Assigns new generated senior nid root for last two generation.
        (setf calculated-senior-nid
              (fn-gnrt-last-2-digits-of-nid inrange-senior-nid-root))

        (fn-wrt-data-history
         (format nil "~3d. ~d" (- relative-count n) calculated-senior-nid))
        
        (format t "~3d. ~d~%" (- relative-count n) calculated-senior-nid)

        ;; Assigns inrange-senior-nid-root to next younger senior.
        (setf inrange-senior-nid-root (- inrange-senior-nid-root 29999))

        ;; If senior-nid-root < 100000000 or > 999999999,
        ;; calculations going to wrong couse of nid system root range.
        ;; NID root must be 9 digits.

        ;; This is the fix:
        (if (> inrange-senior-nid-root 1000000000)
            (setf inrange-senior-nid-root
                  (+ (rem inrange-senior-nid-root 1000000000) 100000000)))))
    
    (fn-wrt-data-history (format nil ""))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-prnt-base-person (proper-nid-root-entry)
  (progn
    (fn-wrt-data-history
     (format nil "===> ~d~%"
             (fn-gnrt-last-2-digits-of-nid proper-nid-root-entry)))

    (format t "===> ~d~%"
            (fn-gnrt-last-2-digits-of-nid proper-nid-root-entry))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-prnt-junior (proper-nid-root-entry relative-count)
  "Gets proper-nid-root-entry and relative-count, processes and prints."
  (let* (;; Relative factor number is: 29999
         (junior-nid-root (- proper-nid-root-entry 29999))
         (inrange-junior-nid-root junior-nid-root)
         (calculated-junior-nid 0))
    
    ;; If junior-nid-root < 100000000 or > 999999999,
    ;; calculations going to wrong couse of nid system root range.
    ;; NID root must be 9 digits.

    ;; This is the fix:
    (if (< junior-nid-root 100000000)
        (setf inrange-junior-nid-root (+ junior-nid-root 900000000)))

    ;; Do relative-count times:
    (dotimes (n relative-count)
      (progn
        ;; Assigns new generated junior nid root for last two generation.
        (setf calculated-junior-nid
              (fn-gnrt-last-2-digits-of-nid inrange-junior-nid-root))

        (fn-wrt-data-history
         (format nil "~3d. ~d" (+ n 1) calculated-junior-nid))
        
        (format t "~3d. ~d~%" (+ n 1) calculated-junior-nid)

        ;; Assigns inrange-junior-nid-root to next younger junior.
        (setf inrange-junior-nid-root (- inrange-junior-nid-root 29999))

        ;; If junior-nid-root < 100000000 or > 999999999,
        ;; calculations going to wrong couse of nid system root range.
        ;; NID root must be 9 digits.

        ;; This is the fix:
        (if (< inrange-junior-nid-root 100000000)
            (setf inrange-junior-nid-root (+ junior-nid-root 900000000)))))
    
    (fn-wrt-data-history (format nil ""))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-gnrt-nidspace-lisp ()
  "Generates whole NID space with Lisp code."
  (let (;; This function is so slow! It takes ~55 hours in my laptop.
        ;; Threading or another hacks can be speed up the code!
        ;; Till that time, C code is the fastest solution of all NIDs
        ;; generation. It takes ~18 minutes! Also C code is multiline
        ;; commented in fn-wrt-c-file function inside
        ;; this program.

        ;; Each NID 13 bytes. Total size of 900000000 NIDs is ~10.9GB.
        ;; My 5400rpm HDD's write capacity is ~35 MB/sec.
        ;; 2250000 NIDs * 13 bytes = ~ 27.9 MB.
        ;; 2250000 NIDs is 1/400 or 0.25% of 900000000.
        
        (whole-nidspace-filename "")
        (progress-percent 0.25)
        (progress-percentage-trigger 0))

    (setq whole-nidspace-filename "trnids-lisp.txt"
          progress-percentage-trigger 102249999)

    (fn-prnt-newline)
    (format t "Lisp Generator is running...~%~%")

    (loop for nid-root from 100000000 to 999999999 do
          (progn
            (fn-wrt-data-file
             whole-nidspace-filename
             (fn-gnrt-last-2-digits-of-nid nid-root))
            (if (= nid-root progress-percentage-trigger)
                (progn
                  (format t "+ ~6,2f ~a Done!..~%" progress-percent '%)
                  (setq progress-percent (+ progress-percent 0.25)
                        progress-percentage-trigger
                        (+ progress-percentage-trigger 2250000))))))))



;; Notes:
;; Test of fn-gnrt-nidspace-lisp

;; (defun fn-gnrt-nidspace-lisp ()
;;   "Generates whole NID space with Lisp code."
;;   (let (;; This function is so slow! It takes ~55 hours in my laptop.
;;         ;; Threading or another hacks can be speed up the code!
;;         ;; Till that time, C code is the fastest solution of all NIDs
;;         ;; generation. It takes ~18 minutes! Also C code is multiline
;;         ;; commented in fn-wrt-c-file function inside
;;         ;; this program.

;;         ;; Each NID 13 bytes. Total size of 900000000 NIDs is ~10.9GB.
;;         ;; My 5400rpm HDD's write capacity is ~35 MB/sec.
;;         ;; 2250000 NIDs * 13 bytes = ~ 27.9 MB.
;;         ;; 2250000 NIDs is 1/400 or 0.25% of 900000000.

;;         (whole-nidspace-filename "")
;;         (progress-percent 0.25)
;;         (progress-percentage-trigger 0))

;;     (setq whole-nidspace-filename "test-trnids-lisp.txt"
;;           progress-percentage-trigger 100000100)

;;     (fn-prnt-newline)
;;     (format t "Lisp Generator is running...~%~%")

;;     (loop for nid-root from 100000000 to 100040000 do
;;           (progn
;;             (fn-wrt-data-file
;;              whole-nidspace-filename
;;              (fn-gnrt-last-2-digits-of-nid nid-root))
;;             (if (= nid-root progress-percentage-trigger)
;;                 (progn
;;                   (format t "+ ~6,2f ~a Done!..~%" progress-percent '%)
;;                   (setq progress-percent (+ progress-percent 0.25)
;;                         progress-percentage-trigger
;;                         (+ progress-percentage-trigger 100))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Controllers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-ctrl-nid-validation ()
  "Gets proper NID and validates."
  (let ((proper-nid-entry 0))
    (fn-chck-nid-validity
     (setf proper-nid-entry (fn-get-chck-nid)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-ctrl-nid-root-to-nid-generation ()
  "Gets proper NID Root and generates NID with it."
  (let ((proper-nid-root-entry 0)
        (calculated-nid 0))

    (setf calculated-nid
          (fn-gnrt-last-2-digits-of-nid
           (setf proper-nid-root-entry (fn-get-chck-nid-root))))

    (fn-wrt-list-history
     (concatenate
      'list
      (vector
       (format nil "~d~a~a" calculated-nid " <<<<< " (fn-get-date-time)))
      (vector "         ^^---- + The valid NID is this!")))
    
    (format t "~%~a~%" calculated-nid)
    (fn-prnt-valid-nid-is-this)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-ctrl-nid-whois ()
  "Gets data from database about NID. Not coded yet!"
  (fn-prnt-developing-in-progress))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-ctrl-possible-relatives-generation ()
  "Generates possible relatives based on NID Root entry."
  (let ((proper-nid-root-entry 0)
        (relative-count 0)
        (selected-relative-type 0)
        (relative-type-selection-menu
          "1. Senior
2. Junior
3. Senior and Junior

Select a type ..."))

    (setf proper-nid-root-entry (fn-get-chck-nid-root))
    (format t "~%How many relatives want you get?~%")
    (setf relative-count (fn-get-chck-positive-numeric))
    (format t "~%~a~%" relative-type-selection-menu)
    (setf selected-relative-type (fn-get-chck-positive-numeric))

    (case selected-relative-type
      (1 (progn; Senior
           (fn-cln-screen)
           (fn-prnt-senior-junior-both-heading
            proper-nid-root-entry 1)
           (fn-prnt-newline)
           (fn-gnrt-prnt-senior
            proper-nid-root-entry
            relative-count)
           (fn-prnt-newline)
           (fn-gnrt-prnt-base-person proper-nid-root-entry)))
      (2 (progn; Junior
           (fn-cln-screen)
           (fn-prnt-senior-junior-both-heading
            proper-nid-root-entry 2)
           (fn-prnt-newline)
           (fn-gnrt-prnt-base-person proper-nid-root-entry)
           (fn-prnt-newline)
           (fn-gnrt-prnt-junior
            proper-nid-root-entry
            relative-count)))
      (3 (progn; Senior and Junior
           (fn-cln-screen)
           (fn-prnt-senior-junior-both-heading
            proper-nid-root-entry 3)
           (fn-prnt-newline)
           (fn-gnrt-prnt-senior
            proper-nid-root-entry
            relative-count)
           (fn-prnt-newline)
           (fn-gnrt-prnt-base-person proper-nid-root-entry)
           (fn-prnt-newline)
           (fn-gnrt-prnt-junior
            proper-nid-root-entry
            relative-count)))
      (otherwise (progn; If entry out of 1,2 or 3; Senior and Junior default.
                   (fn-cln-screen)
                   (fn-prnt-senior-junior-both-heading
                    proper-nid-root-entry 3)
                   (fn-prnt-default-option-assigned)
                   (fn-prnt-newline)
                   (fn-gnrt-prnt-senior
                    proper-nid-root-entry
                    relative-count)
                   (fn-prnt-newline)
                   (fn-gnrt-prnt-base-person proper-nid-root-entry)
                   (fn-prnt-newline)
                   (fn-gnrt-prnt-junior
                    proper-nid-root-entry
                    relative-count))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-ctrl-gnrt-prnt-random-valid-nid ()
  (let ((random-nid-count 0)
        ;; NID root has only 9 digits.
        ;; 10th and 11th digits generates from root.
        (int-lst-random-valid-nid-root '()))

    (format t "How many random NIDs want you get?~%")

    (setf random-nid-count (fn-get-chck-positive-numeric))

    (fn-prnt-newline)

    (fn-wrt-list-history
     (concatenate
      'list
      (vector
       (format nil "[ Random  ]~a~a" " <<<<< " (fn-get-date-time)))))
    
    (loop for i from 1 to random-nid-count do
          (progn
            (setf int-lst-random-valid-nid-root '())

            (setf int-lst-random-valid-nid-root
                  (append int-lst-random-valid-nid-root
                          (list (fn-gnrt-random-number 'without-zero))))
            
            ;; 2 to 9 digits can be 0 to 9.
            (dotimes (n 8)
              
              (setf int-lst-random-valid-nid-root
                    (append int-lst-random-valid-nid-root
                            (list (fn-gnrt-random-number 'normal)))))
            
            (let ((int-random-valid-nid-root
                    (fn-cnvrt-str-to-int
                     (fn-cnvrt-list-to-str
                      int-lst-random-valid-nid-root))))
              
              ;; (let ((int-random-valid-nid
              ;;         (fn-gnrt-last-2-digits-of-nid
              ;;          int-random-valid-nid-root)))

              ;;   (fn-wrt-data-history
              ;;    (format nil "~d" int-random-valid-nid))
              
              ;;   (format t "~d~%" int-random-valid-nid))

              (let ((int-random-valid-nid
                      (fn-gnrt-last-2-digits-of-nid
                       int-random-valid-nid-root)))

                (fn-wrt-data-history
                 (format nil "~d" int-random-valid-nid))
                
                (format t "~d~%" int-random-valid-nid))

              )))

    (fn-wrt-data-history (format nil ""))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-ctrl-nidspace-generation ()
  (let ((nidspace-gen-explanation-and-menu
          "This module contains two different mode:

+ Lisp Generator [ Default  ] [ Slow ]
+ C Generator    [ Optional ] [ Fast ]

Lisp Generator will be run with select option '1' below!

But if your system has any C compiler;
you can compile nidspace-generator.c file in this directory
and generate all possible NIDs with compiled executable.

e.g.

compile : gcc -Wall nidspace-generator.c -o nidspace-generator.exe
run     : ./nidspace-generator.exe

1. Run Lisp Generator
2. Return")
        (nidspace-gen-menu-selection 0))

    (format t "~a~%" nidspace-gen-explanation-and-menu)
    (setf nidspace-gen-menu-selection (fn-get-chck-positive-numeric))
    (if (= nidspace-gen-menu-selection 1)
        (time (fn-gnrt-nidspace-lisp)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Calculations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-sum-numeric-list-elements (will-be-summed-list)
  "Calculates sum of given lists elements."
  (apply #'+ will-be-summed-list))

;; Note:
;; (apply #'+ a-list) and (apply (function +) a-list) is same.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Date, Time Getters, Printers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-get-date-time ()
  "Gets date and time."
  (multiple-value-bind
	(second minute hour date month year day-of-week dst-p tz)
      (get-decoded-time)
    (format nil "~2,'0d:~2,'0d:~2,'0d, ~a, ~d/~2,'0d/~d (GMT~@d) ~a"
            hour
            minute
            second
            (nth day-of-week '("Monday" "Tuesday" "Wednesday"
                               "Thursday" "Friday" "Saturday"
                               "Sunday"))
            date
            month
            year
            (- tz)
            dst-p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun fn-gnrt-prnt-elapsed-time (start-time end-time)
;;   (let* (;; internal-time-units-per-second = 1000 in SBCL bur in clisp
;;          ;; 1000000(*nix) or 10000000(Win). I choose SBCL.
;;          ;; duration: time integer to milliseconds conversion factor 1000
;;          ;; hours: (duration / 3600000)
;;          ;; minutes: ((duration / 60000) % 60)
;;          ;; seconds: ((duration % 60000) / 1000)
;;          ;; milliseconds: (duration % 1000)
;;          ;;(duration (floor (- end-time start-time) 1000))
;;          (duration (- end-time start-time))
;;          (hours (floor duration 3600000))
;;          (minutes (rem (floor duration 60000) 60))
;;          (seconds (floor (rem duration 60000) 1000))
;;          (milliseconds (rem duration 1000)))
;;     (if (> hours 0)
;;         (format t "[ Done! ] ~d h. ~d m. ~d s. ~d ms.~%"
;;                 hours minutes seconds milliseconds)
;;         (progn
;;           (if (> minutes 0)
;;               (format t "[ Done! ] ~d m. ~d s. ~d ms.~%"
;;                       minutes seconds milliseconds)
;;               (progn
;;                 (if (> seconds 0)
;;                     (format t "[ Done! ] ~d s. ~d ms.~%"
;;                             seconds milliseconds)
;;                     (format t "[ Done! ] ~d ms.~%" milliseconds))))))
    
;;     (fn-prnt-seperator)))


;; (defun fn-main ()
;;   (let ((start-time (get-internal-real-time))
;;         (end-time 0))
    
;;     (fn-prnt-main-menu)
    
;;     (setf end-time (get-internal-real-time))
;;     (fn-gnrt-prnt-elapsed-time start-time end-time)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fn-main () (time (fn-prnt-main-menu)))

(fn-main)
