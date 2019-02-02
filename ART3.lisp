;;******************************* ART3.lisp ****************************************
;;Author: Tom G. Stevens PhD
;;  (Some functions based upon material from Mark Watson (1990)
;;
;;======= SSS START HERE TO RUN ART3 ======================
;;
;;TO RUN ART3 --THIS REPLACED MyART2.lisp
;; 1- ADJUST PARAMETERS ==>>  GO TO config-ART3.lisp
;; 2- (RUNART3 T)  ;;Optional T loads all files again

;; BASED UPON ART3-MODEL.lisp:  a copy of  ART 3: Hierarchical Search Using Chemical Transmitters in Self-Organizing Pattern Recognition Architectures, GAlL A. CARPENTER AND STEPHEN GROSSBERG;Neural Networks, Vol. 3. pp. 129-152, 1990
;;
;;
;;SSSS START HERE CURRENT NOTES

;;1. SSSS PROBLEMS:





;; PREVIOUS PROBLEMS -- SOLVED??
;; RESET RELATED ISSUES:  --------------------------------------------------
;;1. USE YI-1-1 OR YI-2-1 TO COMPARE TO F2?? xi-2-1 seems very insensitive to changes in the inputs. COMPARE YI-1-1 TO YI-1-2? OR YI-2-2?
;;CHANGED TO LAYER 1's comparison and it became much more sensitive to changes in input patterns.
;; Note: Grossberg model shows Y nodes as input to reset, and not sure but X as targets from reset output?
;;RESET PROBLEM: If the F3 resets are different node (i) values, then when calculating the eg. x from y values in different levels, then it will affect the x values (dramatically in the case y has been set to 999). If it omits that y node (not currently done) in the calculations, then that will also distort the values.  [Could have a default y value eg .1] etc. But a poor solution.? 
;;Possible solutions? 
;; 1. Force all resets to be same node number in F3: problem of not resetting the highest values in some layers.
;;;2. Go back to the older using resetnin and resetnout,  but must have reset vals for all layers.
;; 3. **CHOSE THIS SOLUTION:   MAY WORK BETTER?? USE TEST-XY-RESET FUNCTION
;;NEXT PROBLEM
;;All F3 x values are very, very small after reset due to being set small by competition before.  Doesn't leave any values--except tiny ones.  Compet values must be higher than reset ones or may choose same node again.



#|
====== FUNCTION HIERARCHY ================================
 1.RUNART3; for making running art-manager easier
 2. ART-MANAGER; Primary overall manager, runs learn-patterns
 3. LEARN-PATTERNS; Takes ALL input-patterns and  Runs each PATTERN *N-PATTERN-CYCLES (one at a time).  Runs entire set of patterns *n-pattern-set-cycles times. Each set run is run-pattern-set-n
 4. RUN-ART-PATTERN-CYCLE.    Loops thru F1-Cycle..F3-Cycle etc.  *N-CYCLES-PER-TDELTA (for each  PATTERN RUN).  UPDATE-WEIGHTS runs once each pattern cycle, not once each tdelta cycle. TEST-RESET currently run on each tdelta cycle. After all tdelta cycles, AT END runs UPDATE-WEIGHTS.

*ART-OVERALL-CYCLE-N is overall total number of times run at lowest level.

|#

#|
======== ITERATION STEPS ================================
Steps 1-7 outline the iteration scheme in the computer program used to generate the simulations. From Grossberg ART3
Step 1. t--> t + Delta-t.
Step 2. Set p and Si-a3 values.
Step 3. Compute rib  and check for reset.
Step 4. Iterate STM equations Fb,Fc five times, setting variables to 0 at reset.
Step 5. Iterate transmitter eqns (38)-(41).
Step 6. Compute sums SUMi vij-bc  and  SUMj vji-cb
Step 7. Return to Step 1.
|#




;; *load-art2-files-p
;;  
(defparameter *load-art2-files-p T "Only used when loading config-art2.lisp. May be reset in RUNART.")



;;RUNART
;;
;;ddd
(defun runart3 (&optional load-config-p &key (load-art2-files-p T))
  "In ART2.lisp, Main test function. Set some init variables here--esp graphing. Then runs ART2-manager. Also contains some key run parameters to set."
  ;;LOAD ART2 CONFIG??
  (setf *load-art2-files-p load-art2-files-p)
  (if  load-config-p
      (load "C:\\3-TS\\LISP PROJECTS TS\\ART3\\config-ART3.lisp"))
  (unless (find-symbol "ART-MULTIPANE-INTERFACE" 'common-lisp-user)
       (load "C:\\3-TS\\LISP PROJECTS TS\\ART3\\config-ART3.lisp"))

  (setf out nil 
        reset-info nil
        *out-icon nil
        *all-reset-info-list nil)

  (setf *overall-cycle-n 1
        *reset-x-gap 10)
  ;;define the input-patterns
   (define-current-input-patterns)

  ;;SET THE MAIN VARIABLES HERE AND IN INIT-ART2
  (let*
      ((input-pattern-lists  *current-input-pattern-list)
       )

    ;;RUN ART3-MANAGER--the main exec function
    (ART3-manager input-pattern-lists) 

    ;;(afout 'out (format nil "AT END OF RUNART, *converted-arrays-list-of-lists= ~A" *converted-arrays-list-of-lists))
    (if (> *print-details 1)(fout out))

   ;;(values *converted-arrays-list-of-lists  *converted-arrays-lists)
   ;;end let, runart3
    ))
;;TEST
;;  (RUNART3)





;;ART3-MANAGER ------------------------------------------------------------------------------
;;mmm
;;ddd  
(defun ART3-manager (input-pattern-lists
                     &key (n-pattern-cycles *n-pattern-cycles)
                     (n-inputs  *n-inputs) (n-outputs *n-outputs)  
                     (graph-every-x-pattern-cycle  *graph-every-x-pattern-cycle)
                     (graph-last-cycle *graph-last-cycle)
                     ;;SSS what do next 2 do??
                     (end-test-all-patterns-n *end-test-all-patterns-n)
                     (graph-end-tests-p  *graph-end-tests-p)
                     ;;graph-every-x-test-cycle
                     initial-x-pix incr-x-pix 
                     (run-random-test-p *run-random-test-p)
                     (graphing-symbols-list *graphing-symbols-list)
                     (ignore-n-pattern-cycles-p *ignore-n-pattern-cycles-p))

  "In ART3.lisp, manages full ART3 execution, initializes, calculates, simple data analysis, and graphing. Set run and model parameters elsewhere."
  (declare (special *learned-categories*  *new-symbols-list *my-reset-broadcast *display-graphs-on-reset))  ;; *converted-arrays-lists *converted-arrays-list-of-lists

  ;;reset overall cycle counter, etc.
  (setf  *art-overall-cycle-n 0
         *n-patterns (length input-pattern-lists)
         *n-art-overall-cycles (* *n-patterns *n-pattern-cycles *n-cycles-per-tdelta))

  (setf *learned-categories* nil  *new-symbols-list nil *my-reset-broadcast nil)
  ;;*converted-arrays-lists nil *converted-arrays-list-of-lists nil
  (setf  *art-data-text NIL
        *art-cycle-data-text nil)
  (let
      ((graphing-array-list)
       (new-symbol-type-list)
       (new-symbols-type-list-of-lists)
       (array-sym-types-list)
       (new-symbol-type-spec-list-of-lists)
       (new-symbol-type-symbol-string-list-of-lists)
       (array-symbol-list-of-lists all-arrays-list)
       (new-root-list)
       (interface-title)
       (date-time (my-get-date-time))
       (converted-symvals-lists)
       (symbols-list)
       (learned-input-patterns)
       )

    ;;STEP 1: INITIALIZE THE ART3 VARIABLES
    (multiple-value-setq (new-symbol-type-list  new-symbols-type-list-of-lists  new-symbol-type-spec-list-of-lists  new-root-list  new-symbol-type-symbol-string-list-of-lists) 
        (ART3-init *n-inputs *n-outputs))

    ;;(afout 'out (format nil "array-sym-types-list= ~A" array-sym-types-list))
    (setf *art-data-text (append *art-data-text (list (format nil ">>>>>>>> NEW ART3 OUTPUT >>>  ~A~%
CONSTANTS-PARAMETERS:~% *delta-t= ~A; *n-cycles-per-tdelta= ~A *n-pattern-cycles= ~A ~%  *p1-all= ~A; *p2-all= ~A; *p3-all= ~A; *p4-3= ~A; *p5-all= ~A; *P6-all= ~A~%*def-sigmoid-val= ~A;  ORIG-ART2:  a= ~A; b= ~A; c= ~A; d= ~A; e= ~A; theta= ~A; *vigilance= ~A *vigilance-multiplier= ~A ~%  *onCenterThreshold= ~A; *min-input-criteria= ~A; ~%*min-g= ~A;*reset-y-criteria= ~A; ~%INITIAL VALUES:~% *art-initial-x= ~A; *art-initial-y= ~A; Weights: upLR= ~A downLR= ~A; *wUpInitLo= ~A, *wUpInitHi= ~A~%*wDnInitLo= ~A *wDnInitHi= ~A~%  *def-reset-xy-val= ~A   *def-nonresetnin-out-val= ~A  def-resetnin-out-val= ~A~%" date-time *delta-t *n-cycles-per-tdelta *n-pattern-cycles *p1-all *p2-all *p3-all *p4-3 *p5-all *P6-all  *def-sigmoid-val  a b c d e theta *vigilance *vigilance-multiplier   *onCenterThreshold *min-input-criteria  *min-g *reset-y-criteria *art-initial-x *art-initial-y  upLR downLR *wUpInitLo *wUpInitHi *wDnInitLo *wDnInitHi   *def-reset-xy-val  *def-nonresetnin-out-val *def-resetnin-out-val))))  ;;WAS *def-nonresetnin-out-val  ; *def-comp-val= ~A *def-comp-val ALSO


    (setf *art-data-text (append *art-data-text (list (format nil ">> ART3 DESIGN PARAMETERS:~%COMPETITION PARAMETERS:  *F3-all-or-none-competative-output-p= ~A;  *F1-all-or-none-competative-output-p= ~A;   *F3-compet-every-nth-time-interval= ~A;   *test-compet-overall-cycle-nums-list= ~A;   *F3L1-compet-p  ~%RESET PARAMETERS:= ~A;   *recalc-F3L1xy-postreset-p= ~A;   *recalc-yi-3-3-postcompet-p= ~A;   *F2-test-reset-p= ~A;   *F3-test-reset-p= ~A;   *test-reset-every-nth-pattern-cycle= ~A;   *test-reset-every-nth-time-interval= ~A;   *test-reset-overall-cycle-nums-list= ~A;   *reset-all-F1F2-p= ~A;   *reset-all-F1F2L1-p= ~A;   *reset-all-F1F2L2-p= ~A;   *reset-all-F3Layer-maxs-p= ~A;   *find-Yi-1-3-max-output-p= ~A;   *find-Yi-3-3-max-output-p= ~A;   *reset-F2-p= ~A;   *reset-XI-1-3-p= ~A;   *reset-XI-2-3-p= ~A;   *reset-XI-3-3-p= ~A   ~%" *F3-all-or-none-competative-output-p *F1-all-or-none-competative-output-p *F3-compet-every-nth-time-interval *test-compet-overall-cycle-nums-list *F3L1-compet-p *recalc-F3L1xy-postreset-p *recalc-yi-3-3-postcompet-p *F2-test-reset-p *F3-test-reset-p *test-reset-every-nth-pattern-cycle *test-reset-every-nth-time-interval *test-reset-overall-cycle-nums-list *reset-all-F1F2-p *reset-all-F1F2L1-p *reset-all-F1F2L2-p *reset-all-F3Layer-maxs-p *find-Yi-1-3-max-output-p *find-Yi-3-3-max-output-p *reset-F2-p *reset-XI-1-3-p *reset-XI-2-3-p *reset-XI-3-3-p   ))))

    ;;(if  *make-art-cycle-data-text-p (setf *art-cycle-data-text *art-data-text))

    ;;STEP 2: INITIALIZE THE ART3 CONSTANTS
    ;;done in calculation function area

    ;;STEP 3: INITIALIZE THE NETWORK (ART3 VARIABLE ACTIVATIONS, ETC)
    ;;is this done elsewhere too??
    ;;was (initNetwork *n-inputs *n-outputs) 
    (init-art-network)

    ;;STEP 4: RUN ART3 -- CALCULATE THE VALUES FOR EACH CYCLE 
    ;; ON EACH FIELD AND CELL    
    (setf *learned-patterns
          (learn-patterns n-inputs n-outputs input-pattern-lists n-pattern-cycles
                          graph-every-x-pattern-cycle   initial-x-pix  incr-x-pix
                          :run-random-test-p run-random-test-p
                          :ignore-n-pattern-cycles-p ignore-n-pattern-cycles-p
                          :graphing-symbols-list graphing-symbols-list
                          :datatext-var-list *art-datatext-syms-list))


    ;;STEP 5: CONVERT ART3 ARRAY VALUES TO X, Y COORDS IN LISTS
    ;; and  STEP 6:  GRAPH THE TERMINAL CELL VALUES 
    ;;if only print graphs for last cycle  

    (cond
     ((and *graph-last-cycle (=  end-test-all-patterns-n 0))
      ;;for keeping track of pane text and graph info
      ;;*art-inst-text-info-list
      ;;*art-inst-graph-info-list            
      (graph-ART  (format nil "ART3 LAST N Cycles= ~A Resets= ~A " *n-art-overall-cycles    (find-art-above-min 'RESETI-2-2) )))
     ((> end-test-all-patterns-n 0)
      (setf learned-input-patterns
            (learn-patterns *n-inputs *n-outputs input-pattern-lists n-pattern-cycles
                            *graph-every-x-pattern-cycle  initial-x-pix  incr-x-pix
                            :run-random-test-p run-random-test-p
                            :ignore-n-pattern-cycles-p ignore-n-pattern-cycles-p
                            :graphing-symbols-list *graphing-symbols-list
                            :datatext-var-list *art-datatext-syms-list))

      ;;graph the end-test patterns
      (when   graph-end-tests-p
        (graph-ART (format nil "ART3 TEST Cycle N= ~A Resets= ~A " *overall-cycle-n  (find-art-above-min 'RESETI-2-2) )))        
      ;;end cond
      ))

    ;;(if *make-art-cycle-data-text-p    (pprint *art-cycle-data-text))
    (if *art-data-text
        (pprint *art-data-text))

    ;;end ART3-manager
    (values converted-symvals-lists  symbols-list)
    ))


;;xxx
;;------------------------------------- ART CYCLE FUNCTIONS ----------------------------------

;;LEARN-PATTERNS
;; Replaces LearnPatterns in ART2
;;
;;ddd
(defun learn-patterns (n-inputs n-outputs input-pattern-lists n-pattern-cycles
                               graph-every-x-pattern-cycle  initial-x-pix incr-x-pix 
                               &key (n-run-pattern-set *n-pattern-set-cycles)
                               run-random-test-p 
                               ignore-n-pattern-cycles-p
                               (graphing-symbols-list  *graphing-symbols-list)
                               (datatext-var-list *art-datatext-syms-list)
                               )
  "In ART3.lisp, Main ART3 Calculation Manager that cycles through all training patterns. *overall-cycle-n is total num cycles run; *art-learn-cycle-n is num times learn-patterns runs; *pattern-cycle-n is cycle within each learn-patterns run; *n-pattern-cycles is cycles per pattern p [NOTE: n-pattern-cycles = (car [pattern]p) Graphs every graph-every-x-pattern-cycle AND If cycle  = member *graph-every-x-pattern-cycle-list]  Runs entire set of patterns n-run-patterns times."

  (declare (special   *all-reset-info-list))

 (if (> *print-details 0)  (afout 'out (format nil ">>>> IN LEARNPATTERNS, INPUT-PATTERNS= ~a ~%" input-patterns)))

  (setf  *art-cycle-counter 0  ;;2013-11 added global var here
         *all-reset-info-list nil
         *pattern-set-cycle-n 0)

  (let
      ((time 0.0)
       ;;from ART2
       (random-input-patterns)
       ;;(pattern-cycle-n)
       (setsym-2dim-nested-lists-p *setsym-2dim-nested-lists-p)      
       (reset-p)
       (F3-resets)
       (pattern)
       )

;;NOTE: test INNER LOOP XX EVALS DIF FROM OUTER XX
;; (defun testxx () (let ((xx  9) (yy)) (loop for xx from 1 to 3 do (setf xx (+ xx  .1) yy xx)  ) (setf xx (+ xx 100)) (values xx yy)))  ;;MUST USE DIF NAME TO GET OUTSIDE LOOP

     ;;SET ACTIVATIONS TO INITIAL VALUES
     (init-art-network)

    ;;IF WANT MULTIPLE RUNS OF ENTIRE SET OF PATTERNS
    (loop
     for run-pattern-set-n from 1 to  n-run-pattern-set
     do
     (incf *pattern-set-cycle-n)

    ;;FOR THE INPUT-PATTERN LIST, RUN EACH PATTERN
    (loop
     for pattern-list in input-pattern-lists
     do
     (incf *pattern-n)

     (cond
      (ignore-n-pattern-cycles-p NIL)
      ((listp (car pattern-list))
       (setf  pattern ( car pattern-list)))
      (t (setf n-pattern-cycles (car pattern-list)
               pattern (second pattern))))

      ;;(if (> *print-details 0)  (afout 'out (format nil ">>>> INPUTS= ~A <<<<" p)))
      (setf *art-data-text (append *art-data-text (list (format nil "~%
 =========>> NEW INPUT PATTERN =====================~%   INPUT PATTERN= ~A   *pattern-n= ~A~%" pattern-list *pattern-n))))

      ;;CHANGED MODEL TO SET NODE VALUE TO 999 IF CHOICE-RESET
      ;; LATER CHECKS TO SEE IF 999, THEN WILL NOT PROCESS, OR 
      ;; IF NECESSARY, SET TO SOME DEFAULT VALUE.
      
      ;;FOR NEW SET X&Y = 999 RESET MODEL, RESET TO *art-initial-x
      (initialize-xy-resets)

      ;;STILL USE FOR GRAPHING
      ;;OLDER RESET MODEL (Problem was that when multiple layers reset, some layers max values were NOT the same as other layers, meaning would need to have reset values for EVERY layer of every FIELD.
     ;;SET ALL RESET VALUES TO 0 with each new INPUT (not each cycle, causes flip-flop betw previous and new y's)
     ;;For RESETNIN 
    (loop
      for n from 1 to n-inputs
      do
      (setsymval 'resetnin  (list n 2 2) 0)
      ;;was (setsymval 'reset-ninputs (list n) 0)
      )
     ;;For RESETNOUT
     (loop
      for n from 1 to n-outputs
      do
      (setsymval 'resetnout  (list n 2 2) 0)
      ;;(setsymval 'reset-noutputs (list n) 0)
      )

     ;;FOR REPEAT EACH PATTERN FOR N-PATTERN-CYCLES
     (set-pattern pattern n-inputs n-outputs)
     (loop
      for pattern-cycle-n from 1 to n-pattern-cycles   ;;was num-Cycles
      do
       (setf  *pattern-cycle-n pattern-cycle-n)     

       (if (> *print-details 0) (afout 'out (format nil ">>>>   *art-overall-cycle-n= ~A *pattern-cycle-n= ~A run-pattern-set-n= ~A~%"  *art-overall-cycle-n *pattern-cycle-n run-pattern-set-n)))

      ;;FOR EACH ART PATTERN
      (run-art-pattern-cycle pattern :time time :n-pattern-cycles n-pattern-cycles)

      ;;WHEN *MAKE-ART-GRAPHS-P and right CYCLE, conditions, GRAPH
      (when *make-art-graphs-p
        ;;If  i is in graph every x cycles or 

        ;;GRAPH ON THIS CYCLE?
        (cond
         ((or
           ;;*graph-every-x-overall-cycle is met
           (whole-number-p (/ *overall-cycle-n *graph-every-x-overall-cycle))
           ;;*graph-every-x-pattern-set-cycle met
           (whole-number-p  (/  pattern-cycle-n  *graph-every-x-pattern-set-cycle ))           
           ;;in graph every x cycles
           (whole-number-p  (/  pattern-cycle-n  graph-every-x-pattern-cycle ))
           ;;on *graph-every-x-pattern-cycle-list 
           (member pattern-cycle-n *graph-every-x-pattern-cycle-list :test  '=)
           ;;or if reset and *display-graphs-on-reset
           (and  *my-reset-broadcast  *display-graphs-on-reset))

          ;;reset it to nil after this is triggered
          (setf *my-reset-broadcast NIL)
               
          ;;NOW PUT VALUES IN THE GRAPHING POINTS-LISTS
          ;;create the interface title 
          (setf  F3-resets (find-art-above-min 'resetnouti-2-2) 
                 interface-title (format nil "ART3 *ART-OVERALL-CYCLE-N ~A F3-Resets= ~A"   *art-overall-cycle-n F3-resets ))

          ;;GRAPH THE POINTS LISTS
          (multiple-value-setq (converted-symvals-lists symbols-list)
              (make-graph-points-lists *art-graph-points-syms-list))
          ;;SS
         ;; (WHEN (MEMBER *art-overall-cycle-n  '(4 8 12 16))  (BREAK))
          ;;*art-graph-points-syms-list = (INPUTI-1-1 XI-2-2 YI-3-3 WUPI-3-2TOI-1-3 WDNI-1-3TOI-3-2  RESETNINI-2-2 RESETNOUTI-2-2)

          ;;GRAPH ART
          (graph-ART  interface-title) 
          (sleep 3)
          )
         (t nil))
        ;;end when *make-art-graphs-p
        )

      ;;MAKE art-cycle-data-text?
#|      (if  *make-art-cycle-data-text-p
          (setf *art-cycle-data-text (append *art-cycle-data-text  (list (make-art-cycle-data-text datatext-var-list )))))  ;;was (input v-activity p u r  reset wup wdn y-output)
|#
  
      ;;END ALL RUN LOOPS
      ;;end inner pattern single run loop, middle all pattern runs loop , outer n-run-patterns loop
      )))

    (if (> *print-details 0)  (afout 'out (format nil "At END of learn-Patterns, *learned-categories* = ~s "    *learned-categories*)))

    ;;FOR RANDOM PATTERNS
    (when  run-random-test-p
      (setf random-input-patterns (my-randomize-list input-patterns))
      (learn-patterns n-inputs n-outputs random-input-patterns 1 1 initial-x-pix incr-x-pix
                     :run-random-test-p nil :ignore-n-pattern-cycles-p T)
      (if (> *print-details 0)  (afout 'out (format nil "At END of RANDOM TEST CYCLES of learnPatterns, *learned-categories* = ~s " *learned-categories*)))
      ;;end when
      )
    ;;end let learn-patterns
    ))



;;RUN-ART-PATTERN-CYCLE
;;was oneCycle in ART2
;;  
;;ddd
(defun run-art-pattern-cycle (pattern &key (n-pattern-cycles *n-pattern-cycles)( time *time))
  "Grossberg's steps:
  Steps 1-7 outline the iteration scheme in the computer program used to generate the simulations:  
   Step 1. t--> t + Delta-t.
   Step 2. Set p and Si-a3 values.
   Step 3. Compute rib  and check for reset.
   Step 4. Iterate STM equations Fb,Fc five times, setting variables to 0 at reset.
   Step 5. Iterate transmitter eqns (38)-(41).
   Step 6. Compute sums SUMi vij-bc  and  SUMj vji-cb
  LOOPS  *n-cycles-per-tdelta  "
  ;;SSS WHAT IS THE ORDER OF  field cycles, competitive, update-weights, reset??)
  (let
      ((x)
       )
    ;;Gr-Step 1. t--> t + Delta-t.
    (setf  *time (+ time *delta-t)
           *tdelta-cycle-n 0)

    ;;Gr-Step 2. Set p and Si-a3 values.
  ;;ITERATION STEPS
  ;;Steps 1-7 outline the iteration scheme in the computer program used to generate the simulations.

  ;;GROSSBERGS 5 STM CYCLES BETWEEN RESETS
  (loop
   for tdelta-cycle-n from 1 to *n-cycles-per-tdelta ;;3?
   do
   (incf  *art-overall-cycle-n)
   (incf  *tdelta-cycle-n)
   ;;SET ALL RESET VALS TO 0
     ;;SET ALL RESET VALUES TO 0 with each new INPUT (not each cycle, causes flip-flop betw previous and new y's)
     ;;For F2 
     (loop
      for n from 1 to *n-inputs
      do
      ;;SSS  -- GET RESET SYMS CONSISTENT
     ;; DO I USE RESET-NINPUTS AND RESET-NOUTPUTS OR JUST RESET????
      (setsymval 'reset-ninputs (list n) 0)
      )
     ;;For F3
     (loop
      for n from 1 to *n-outputs
      do
      (setsymval 'reset-noutputs (list n) 0)
      )

  ;;(if (> *print-details 0)(afout 'out (format nil "=======> START  run-art-pattern-cycle:~% >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>")))
  (setf *art-data-text (append *art-data-text (list (format nil "=======> START  run-art-pattern-cycle: tdelta-cycle-n= ~A ~% >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>" tdelta-cycle-n))))

   ;;F1-CYCLE
  (F1-cycle) 

  ;;(if (> *print-details 0)(afout 'out (format nil "=======> START  run-art-pattern-cycle:~% >>>>> STEP 1: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>")))
  (setf *art-data-text (append *art-data-text (list (format nil "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"))))
   ;;F2-CYCLE
  (F2-cycle)

;;PUT RESET HERE, SO F3 DATA CAN BE CALC FOR GRAPHING AFTER IT
(when  (and *F2-test-reset-p 
               (or 
                (and (numberp *test-reset-every-nth-pattern-cycle)
                     (whole-number-p (/ *pattern-cycle-n *test-reset-every-nth-pattern-cycle)))
                (and (numberp *test-reset-every-nth-time-interval)
                     (whole-number-p (/ *pattern-cycle-n *test-reset-every-nth-time-interval)))
                (member *overall-cycle-n *test-reset-overall-cycle-nums-list)
                   ))
     (setf *art-data-text (append *art-data-text (list (format nil ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>~%"))))
     (TEST-RESET))


  ;;I added competitive-F-output (not in ART2?)
;;  (if (> *print-details 0)(afout 'out (format nil ">>>>>  BEGIN  competitive-F-output for  yi-3-2  >>>>>>>>>>>>>>>")))
  
#| TO WORK COMPET MUST BE WITHIN F3-CYCLE
  ;;COMPETE ONLY IF "CHOICE" ALL-OR-NONE F1 MODEL
  (when *F1-all-or-none-competative-output-p
    (setf *art-data-text (append *art-data-text (list (format nil ">>>>>  BEGIN  competitive-F-output for  yi-3-2  >>>>>>>>>>>>>>>"))))
    (competitive-F-output  'yi-3-1 :n-nodes *n-inputs))|#
   ;;was later, but ART3 F2 like ART2 F1

;;test-reset only after *n-cycles-per-tdelta?
;; (TEST-RESET)

 ;;was here, moved to after F2-cycle because compares  yi-2 of each  (if (> *print-details 0)(afout 'out (format nil ">>>>> STEP 2: BEGIN  test-reset  >>>>>>>>>>>>>>>")))
  ;;(if (> *print-details 0)(afout 'out (format nil ">>>>> STEP 3: BEGIN  competitiveF2  >>>>>>>>>>>>>>>")))
  ;;should this be after F2 and F3??  IS YI-3-2 (or xI-3-2) RIGHT?? SSS
 ;;SSS FOR F1,L1; IS THIS WHERE COMPET TAKES PLACE??? 

;; must put INSIDE OF F3 after calc yi-1-3??
 ;; (competitive-F-output  'yi-1-3  :n-nodes *n-outputs)
 ;;SS NOT UPDATE WEIGHTS UNTIL AFTER SEVERAL COMPLETE F1-F3 CYCLES--GROSSBERG
 ;; (update-weights  'YI-1-3  :WDN-SYM  'WDNI-1-3TOI-3-2 :WUP-SYM  'WupI-3-2TOI-1-3)    ;;was  'YI-3-2

 ;; (if (> *print-details 0)(afout 'out (format nil ">>>>> STEP 4: BEGIN  F2STMcycle  >>>>>>>>>>>>>>>")))


 ;; (if (> *print-details 0)(afout 'out (format nil "=======> START  run-art-pattern-cycle:~% >>>>> STEP 1: BEGIN  F3-CYCLE >>>>>>>>>>>>>>>")))

   ;;F3-CYCLE
  (F3-cycle)
 ;;(if (> *print-details 0)(afout 'out (format nil ">>>>> STEP 5: BEGIN  update-weights  >>>>>>>>>>>>>>>")))
;;no weights here?  (update-weights  'xi-3-3 :wdn T)
;;no weights here?   (update-weights  'yi-3-3 :wup T)



   ;;(if (> *print-details 0)(afout 'out (format nil ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>")))

;; TEST RESET ONLY AFTER MULTIPLE CYCLES 
;;Do reset before f3-cycle  to prevent make-graph-points-list from having no f3 calc data
   ;;??test-reset only after *n-cycles-per-tdelta and BEFORE competitive-F; otherwise the max node is later reset, and only the identical rest node values are left for wdn.
   (when  (and *F3-test-reset-p 
               (or 
                (and (numberp *test-reset-every-nth-pattern-cycle)
                     (whole-number-p (/ *pattern-cycle-n *test-reset-every-nth-pattern-cycle)))
                (and (numberp *test-reset-every-nth-time-interval)                     
                     (whole-number-p (/ *pattern-cycle-n *test-reset-every-nth-time-interval)))
                (member *overall-cycle-n *test-reset-overall-cycle-nums-list)
                   ))
     (setf *art-data-text (append *art-data-text (list (format nil ">>>>>  TEST-RESET AFTER F3-CYCLE >>>>>>>>>>>>~%"))))
     (TEST-RESET))

 #|  -----------------  MOVED BELOW TO EARLY IN F3-CYCLE ------------
 ;;F3, L3 COMPETITIVE-F-OUTPUT ONLY IF "CHOICE" ALL-OR-NONE F3 MODEL
  (when (and *F3-all-or-none-competative-output-p 
             (numberp *F3-compet-every-nth-time-interval))
    (when (or 
           (whole-number-p (/ *pattern-cycle-n *F3-compet-every-nth-time-interval)) 
           (member *overall-cycle-n *test-compet-overall-cycle-nums-list))
      (setf *art-data-text (append *art-data-text (list (format nil ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"))))
      ;;SS WHERE TO COMPETE IN F3, L1,2,3?? 
      ;; PUT COMPET L1 INSIDE F3-CYCLE
      ;;TRY BOTH L1, L3;; ALSO X VS Y
      ;;not needed? 
      (competitive-F-output  'XI-3-3 :n-nodes *n-outputs)
      (competitive-F-output  'YI-3-3 :n-nodes *n-outputs) )
|#      ;;when *recalc-yi-3-3-postcompet-p and END of entire pattern cycle

      #|SSS fix if really want to recalc
           (when (and *recalc-yi-3-3-postcompet-p
               (whole-number-p (/ *overall-cycle-n (* *pattern-cycle-n *tdelta-cycle-n))))
      (update-x-y-node-values 'xi-3-3 'yi-3-3)
      (setf *art-data-text (append *art-data-text (list (format nil "==>> AT END OF ENTIRE PATTERN CYCLE, F3 X and Y values recalculated~% yi-3-3-vals= ~A~%" (nth-value 1 (get-art-bottomsym-values 'yi-3-3))))))
      ;;end when (or
      )
    ;;end when *F3...
    )
 ;;END MOVED TO EARLY IN F3-CYCLE 
|#



  ;;END GROSSBERGS SHORT 5 CYCLE  LOOP  
  )
   
  ;;SS UPDATE WEIGHTS AFTER *n-cycles-per-tdelta  3 CYCLES (GROSSBERG USES 5 CYCLES) 
  (update-weights  'YI-1-3  :WDN-SYM  'WDNI-1-3TOI-3-2 :WUP-SYM  'WupI-3-2TOI-1-3)                   

  ;;end let, run-art-pattern-cycle
  ))
;;TEST
;; (run-art-pattern-cycle (car *current-input-pattern-list))




;;xxx --------------------------- SUB RUN-ART-PATTERN-CYCLE FUNCTIONS -----------------


;;F1-CYCLE
;;was F1STMcycle
;;
;;ddd
(defun F1-cycle ()  ;;*n-inputs *n-outputs &aux i j sum norm max1 max2)
  "In ART3.lisp, Updates F1 STM values."
  ; Calculate p from u input and backwards feed back:
  ;;(break "Beginning of F1STMcycle")
  (let
      ((input)
       (xi-1-1)  ;;(w)
       (yi-1-1)  ;; (x-activity)
       (xi-2-1)  ;; (v-activity)
       (yi-2-1)  ;; (u)
       (xi-3-1)  ;; (p)
       (yi-3-1)  ;; (q-activity)
       (yi-2-2) ;;needed
       (yi-3-1)
       (sig-yi-1-1)
       (sig-yi-2-1) 
       (sigp-yi-2-1)
       (sigp-yi-3-1)
       (sig-yi-1-1-vals)
       (sig-yi-2-1-vals)
       (sigp-yi-3-1-vals)
       ;;for data text
       (input-vals)
       (xi-1-1-vals)
       (xi-2-1-vals)
       (xi-3-1-vals)
       (yi-1-1-vals) 
       (yi-2-1-vals)
       (yi-3-1-vals)

       (ri-2-1-vals)

       (sum-F3dn)
       (r)
       (ri-2-1)
       (L2norm-xi-1-1)     ;;(L2norm-w)
       (L2norm-xi-1-1-e)  ;;(L2norm-w-e) what is this??
       (L2norm-xi-2-1)     ;;(L2norm-v)
       (L2norm-xi-2-1-e)
       (L2norm-xi-3-1)     ;;(L2norm-p)
       (L2norm-xi-3-1-e)  ;;(L2norm-p-e) ;;??? what is this
       (p0)
       (wdn)
       (max-yi-2-1)  ;;(max1u)
       (max2yi-2-2)
       ;;(max-xi-3-1)  ;;(max2p)       
       )

     ;;(if (> *print-details 0) (afout 'out (format nil ">>>>> IN  F1STMcycle, *n-inputs= ~s " *n-inputs)))
     (setf *art-data-text (append *art-data-text (list (format nil ">>>>> IN  F1STMcycle, *n-inputs= ~s~% " *n-inputs))))

    ;;STEP 1. FIND xi-1-1 VALUES FROM INPUT +  YI-2-1 SIGNAL (p1-1  *  Si-2-1)  
    ;; Step 5: Update  xi-1-1 (w) using yi-2-1 sig-yi-2-1 xi-1-1 *p1-all  input
    ;;                                               (was: u      sigmoid-u w *p1-all input)  (Watson eq. 8)
    (loop
     for i from 1 to *n-inputs
     do
     (setf input (getsymval 'input (list i 1 1))
           yi-2-1 (getsymval 'y  (list  i 2 1 )) 
           sigp-yi-2-1 (* *p1-all  (sigmoid yi-2-1))   ;;*p1-all = 10.0, was alpha= 1.0
           xi-1-1 (+ input  sigp-yi-2-1)   
           xi-1-1-vals (append xi-1-1-vals (list xi-1-1))
           input-vals (append input-vals (list input)))

     ;;Set the xi-1-1 value
     (setsymval 'x (list i 1 1)  xi-1-1)               ;;was (setsymval 'w (list i)  w)

     ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 5: FIND xi-1-1,  FOR i= ~A~%  xi-1-1=(* *p1-all (+ input  (* a  (sigmoid yi-2-1))))= ~A;  *p1-all= ~A input= ~A  a=~A sig-yi-2-1= ~A  yi-2-1= ~A " i  xi-1-1 *p1-all input  a sig-yi-2-1 yi-2-1  )))

     ;;end loop
     )
    (setf *art-data-text (append *art-data-text (list (format nil "~%==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= ~A; **pattern-cycle-n= ~A  *n-pattern-cycles= ~A;~% INPUT-VALS= ~A~%~%~%STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= ~a;  ~%FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= ~A  %" *overall-cycle-n  *pattern-cycle-n *n-pattern-cycles input-vals xi-1-1-vals *p1-all  ))))

    ;;STEP 2: UPDATE YI-1-1 USING XI-1-1, L2NORM-XI-1-1

    ;;Step 2.1: Calc L2norm-xi-1-1
    (setq L2norm-xi-1-1 (L2NORM  'xi-1-1 *n-inputs) 
         L2norm-xi-1-1-e (+ L2norm-xi-1-1  e))

    ;;(if (> *print-details 1) (afout 'out (format nil "~%Step 6: FIND yi-2-1,~%Step 6.1 UPDATE L2norm-xi-1-1-e=  ~A after xi-1-1 loop:~%; L2norm-xi-1-1 ~A " L2norm-xi-1-1-e  L2norm-xi-1-1)))

    ;;Step 2.2 Calc yi-1-1 from L2norm-xi-1-1-e
    (loop
     for i from 1 to *n-inputs
     do
     ;;setting yi-1-1  ;;was x-activity
     (setf xi-1-1  (getsymval 'x (list  i 1 1))
           yi-1-1    (/ xi-1-1  L2norm-xi-1-1-e )
           yi-1-1-vals (append yi-1-1-vals (list yi-1-1)))

     ;;Set the yi-1-1 value
     (setsymval 'y  (list i 1 1) yi-1-1)  

    ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 6.2 FIND yi-1-1= ~A~% FOR i= ~A~% yi-1-1=(my-floor-ceiling (/ xi-1-1  L2norm-xi-1-1-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-1= ~A  L2norm-w-e= ~s "  yi-1-1 i  xi-1-1  L2norm-xi-1-1-e)))     

     ;;end loop
     )
    (setf *art-data-text (append *art-data-text (list (format nil "~%Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= ~a  ~%FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= ~s "  Yi-1-1-vals    L2norm-xi-1-1-e))))

 ;;STEP 3: CALC XI-2-1 VALUES based upon YI-1-1 (Si-1-1) SIGNAL + YI-3-1 SIGNAL (p2-1 * Si-3-1 )
    (loop
     for i from 1 to *n-inputs
     do 
     (setf yi-1-1  (getsymval 'y (list i 1 1))
           yi-3-1   (getsymval 'y (list i 3 1))
           sig-yi-1-1 (sigmoid  yi-1-1)
           sigp-yi-3-1 (* *p1-all  (sigmoid yi-3-1))
           xi-2-1 (+ sig-yi-1-1 sigp-yi-3-1)
           sig-yi-1-1-vals (append sig-yi-1-1-vals (list sig-yi-1-1))
           sigp-yi-3-1-vals (append sigp-yi-3-1-vals (list sigp-yi-3-1))
           xi-2-1-vals (append xi-2-1-vals (list xi-2-1)))

     ;;Set the xi-2-1 value
     (setsymval 'x (list i 2 1) xi-2-1)  ;;was (setsymval 'v-activity (list i) v-activity)
     ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 4: FIND xi-2-1, FOR i= ~A~%xi-2-1=(sigmoid (+ yi-1-1 (* b yi-3-1)))= ~A;  yi-1-1= ~A  b= ~A  yi-3-1= ~A%" i xi-2-1 yi-1-1 b yi-3-1)))

     ;;end loop
     )
     (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 4: FIND XI-2-1-VALS= ~A ~%FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= ~A %sig-yi-1-1-vals= ~A~%sigp-yi-3-1-vals= ~A~%"  xi-2-1-vals  *p1-all sig-yi-1-1-vals sigp-yi-3-1-vals))))


     ;;STEP 4: CALC YI-2-1  USING XI-2-1 AND NORM-XI-2-1

     ;;Step 3.1: Calc L2norm-xi-2-1
     (setf  L2norm-xi-2-1 (L2NORM  'xi-2-1  *n-inputs)
            L2norm-xi-2-1-e (+ L2norm-xi-2-1 e))
     ;;Step 3.2 Calc yi-2-1 values
     (loop
      for i from 1 to *n-inputs
      do
      (setf  xi-2-1 (getsymval 'x (list i 2 1))  
             yi-2-1   (/ xi-2-1  L2norm-xi-2-1-e)
             yi-2-1-vals  (append yi-2-1-vals (list yi-2-1)))

      ;;Set the yi-2-1 value
      (setsymval 'y (list  i 2 1)  yi-2-1) 

      ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 3: FIND yi-2-1, FOR i= ~A, ~& yi-2-1= (/ v-activity0i L2norm-v)= ~A;  xi-2-1= ~A  L2norm-xi-2-1= ~A" i  yi-2-1 xi-2-1  L2norm-xi-2-1)))
      ;;end loop
      )
      ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 3: FIND yi-2-1, FOR i= ~A, ~& yi-2-1= (/ xi-2-1init L2norm-xi-2-1)= ~A;  xi-2-1init ~A  L2norm-xi-2-1= ~A" i  yi-2-1  xi-2-1init L2norm-xi-2-1)))
    (setf *art-data-text (append *art-data-text (list (format nil  "~%Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= ~A, ~%FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= ~A" yi-2-1-vals     L2norm-xi-2-1))))

     ;;STEP 5: CALC XI-3-1 FROM YI-2-1 SIGNAL (Si-2-1) ONLY (Since no adaptive inputs from F2) 
     (loop
      for i from 1 to *n-inputs
      do
     (setf  yi-2-1  (getsymval 'y (list i 2 1))
            sig-yi-2-1   (sigmoid yi-2-1)     ;;was  (+ yi-2-1  sum-F3dn))
            xi-3-1  sig-yi-2-1 ;;filters only signals > *p1-all go thru
            xi-3-1-vals (append xi-3-1-vals (list xi-3-1))
            sig-yi-2-1-vals (append sig-yi-2-1-vals (list sig-yi-2-1)))

     ;;Set the xi-3-1 value
     (setsymval 'x (list i 3 1) xi-3-1) 

     ;;(if (>  *print-details 1) (afout 'out (format nil  "~%STEP 4:  FIND xi-3-1 FOR each i ~%xi-3-1-vals=~A =yi-2-1= ~A sig-yi-2-1= ~A"  xi-3-1-vals yi-2-1 sig-yi-2-1 )))

     ;;end loop 
     )
     (setf *art-data-text (append *art-data-text (list (format nil  "~%Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= ~A, ~%FOR each i; xi-3-1  sig-yi-2-1-vals= ~A"  xi-3-1-vals sig-yi-2-1-vals  ))))


    ;;STEP 6: CALC YI-3-1 BASED UPON P AND L2NORM-XI-3-1

    ;;Step 5.1: Calc L2norm-xi-3-1-e
    (setf  L2norm-xi-3-1  (L2NORM 'xi-3-1 *n-inputs)
          L2norm-xi-3-1-e  (+ L2norm-xi-3-1  e))


    ;;Step 5.2: Calc yi-3-1 values based upon  L2norm-xi-3-1-e
    (loop
     for i from 1 to *n-inputs
     do
     (setf xi-3-1 (getsymval 'x (list  i 3 1))
           yi-3-1  (/  xi-3-1  L2norm-xi-3-1-e) 
           yi-3-1-vals (append yi-3-1-vals (list yi-3-1)))

     ;;Set the yi-3-1 value
     (setsymval 'y  (list  i 3 1) yi-3-1) 

     ;;(if (= *print-details 3) (afout 'out (format nil "~%Step 2: FIND yi-3-1, FOR i= ~A, yi-3-1= (/ pi  norm-p-e)= ~A;  xi-3-1= ~A   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= ~A" i yi-3-1 xi-3-1 L2norm-xi-3-1-e)))

     ;;end loop
     )
     (setf  *art-data-text (append *art-data-text (list (format nil "~%STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= ~A,  ~%FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= ~A"  yi-3-1-vals   L2norm-xi-3-1-e))))

     (setf  *art-data-text (append *art-data-text (list (format nil "============>  END  F1-cycle ==============%"))))
     
     ;;return nil, not *art-data-text
     NIL
    ;;end let, F1-cycle
    ))
;;TEST
;;  (F1-CYCLE)



;;F2-CYCLE
;;
;;ddd
(defun F2-cycle ()  
  "In ART3.lisp, Updates F2 STM values."
  (let
      ((yi-3-1)
       (xi-1-2)  ;;(w)
       (yi-1-2)  ;; (x-activity)
       (sig-yI-1-2)
       (xi-2-2)  ;; (v-activity)
       (YI-2-1) ;;used in calc reset below
       (yi-2-2)  ;; (u)
       (sig-yI-2-2)
       (sigp-yI-2-2)
       (xi-3-2)  ;; (p)
       (yi-3-2)  ;; (q-activity)
       (yi-1-3)
       (sum-F3dn)
       (xi-2-2-vals) ;;(v-activity0)
      (yi-3-1-vals)
       (xi-1-2-vals)  ;;(w)
       (yi-1-2-vals)  ;; (x-activity)
       (xi-2-2-vals)  ;; (v-activity)
       (YI-2-1-vals) ;;used in calc reset below
       (yi-2-2-vals)  ;; (u)
       (xi-3-2-vals)  ;; (p)
       (yi-3-2-vals)  ;; (q-activity)  
       (sig-yi-2-2-vals)
       (sigp-yi-2-2-vals)
       (sigp-yi-3-2)
       (sigp-yI-3-2-vals)
       (sig-yi-1-3)
       (sig-yi-1-3-vals)
       (wdn-vals)
       (ri-2-2-vals)
       ;;not needed? (wup-vals)
       (r)
       (ri-2-2)
       (L2norm-xi-1-2)     ;;(L2norm-w)
       (L2norm-xi-1-2-e)  ;;(L2norm-w-e) what is this??
       (L2norm-xi-2-2)     ;;(L2norm-v)
       (L2norm-xi-3-2)     ;;(L2norm-p)
       (L2norm-xi-3-2-e)  ;;(L2norm-p-e) ;;??? what is this
       (p0)
       (wdn)
       ;;(max1yi-2-1)
       ;;(max2yi-2-2)  
       (max1yi-2-1-index)
       (max1yi-2-1-val)
       (max2yi-2-2-index)
       (max2yi-2-2-val)
       ;;from ART2 field2
       (i)
       (j)
       (sum-yi-3-2-wup)
       (p)
       ;;(wup)
       ;;(y-output)
       (reset-ninputs) 
       (reset-noutputs) 
       )
    ;;(if (> *print-details 0)  (afout 'out (format nil ">>>>> IN  F2-cycle, *n-inputs= ~s " *n-inputs)))
     (setf *art-data-text (append *art-data-text (list (format nil "~%>>>>> IN  F2-cycle, *pattern-cycle-n= ~A *n-inputs= ~s " *pattern-cycle-n  *n-inputs))))

   ;;STEP 1: FIND XI-1-2
  ;; New Step 1: INPUTS FROM F1,  yi-3-1 to xi-1-2
  ;; Step 5: Update  xi-1-2 (w) using yi-3-1 sig-yi-2-2 *p1-all 
  ;;                                               (was: u    sigmoid-u w *p1-all input)  (Watson eq. 8)
  (loop
   for i from 1 to *n-inputs
   do
   (setf yi-3-1 (getsymval 'y (list i 3 1))  ;;should this be a sigmoid too??
         yi-2-2 (getsymval 'y (list i 2 2))   
         sigp-yI-2-2 (* *p2-all  (sigmoid yi-2-2))  ;;     *p2-all= 10.0   
         sig-yi-3-1 (sigmoid yi-3-1)
         xi-1-2 (+ sig-yi-3-1 sigp-yI-2-2)
         ;;was xi-1-2  (* *p2-all  (+ yi-3-1  (* a  sig-yi-2-2))) ;; a=0.7, *p2-all= 10.0 
         ;;was w (* alpha (+ input  (* a  sigmoid-u))))
         xi-1-2-vals  (append xi-1-2-vals (list xi-1-2))
         sigp-yI-2-2-vals (append sigp-yI-2-2-vals (list sigp-yI-2-2)))

   ;;Set the xi-1-2 value
   (setsymval 'x (list i 1 2)  xi-1-2)               ;;was (setsymval 'w (list i)  w)

   ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 5: FIND xi-1-2, FOR i= ~A~%  xi-1-2=(* *p1-all (+ input  (* a  (sigmoid yi-2-2))))= ~A;  *p2-all= ~A yi-3-1= ~A  a=~A sigp-yI-2-2= ~A  u= ~A " i  xi-1-2 *p2-all yi-3-1  a sigp-yI-2-2 yi-2-2  )))

   ;;end loop
   )
     (setf *art-data-text (append *art-data-text (list (format nil  "In F2-CYCLE *overall-cycle-n= ~A~%Step 1: FIND xi-1-2-vals= ~A~%FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= ~A yi-3-1-vals  a=~A sigp-yI-2-2= ~A  yi-2-2-vals " *overall-cycle-n  xi-1-2-vals  *p2-all   a sigp-yI-2-2  ))))

  ;; STEP 2: UPDATE YI-1-2 USING XI-1-2, L2NORM-XI-1-2
    (setq L2norm-xi-1-2 (L2NORM  'xi-1-2 *n-inputs) 
         L2norm-xi-1-2-e (+ L2norm-xi-1-2  e))
    ;;(setq norm (+ (L2NORM 'w *n-inputs) e)) ;;causes div by 0 sometimes

    ;;(if (> *print-details 1) (afout 'out (format nil "~%Step 6: FIND yi-1-2,~%Step 6.1 UPDATE L2norm-xi-1-2-e= ~A after w loop:~%; L2norm-xi-1-2= ~A " L2norm-xi-1-2-e L2norm-xi-1-2)))
     (setf  *art-data-text (append *art-data-text (list (format nil "~%Step 2: FIND yi-1-2,~%Step 6.1 UPDATE L2norm-xi-1-2-e= ~A after w loop:~%; L2norm-xi-1-2= ~A " L2norm-xi-1-2-e  L2norm-xi-1-2))))

    ;;Step 2.1 Find yi-1-2  from normalized xi-1-2
    (loop
     for i from 1 to *n-inputs
     do
     ;;setting yi-1-2  ;;was x-activity
     (setf xi-1-2  (getsymval 'x (list  i 1 2))
           yi-1-2   ;;was x-activity 
           (/ xi-1-2  L2norm-xi-1-2-e ) ;;:floor *x-activity-floor :ceiling *x-activity-ceiling)
           yi-1-2-vals (append yi-1-2-vals (list yi-1-2)))
     
     ;;Set the yi-1-2 value
     (setsymval 'y (list  i 1 2) yi-1-2) 
     
     ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 6.2 FIND yi-1-2, FOR i= ~s~% yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling)= ~s; w= ~A   L2norm-xi-1-2-e= ~s " i yi-1-2 xi-1-2  L2norm-xi-1-2-e)))

     ;;end loop
     )
     (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 3: FIND yi-1-2-vals=  ~A~%FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= ~s "  yi-1-2-vals   L2norm-xi-1-2-e))))
    ;;Note: new xi-2-2 calc near end with r


      ;;STEP 3:  UPDATE  YI-2-2 using L2norm-xi-2-2      
      (setf  L2norm-xi-2-2 (L2NORM  'xi-2-2  *n-inputs))
      ;;was (setf  L2norm-v (L2NORM  'v-activity  *n-inputs))

      (loop
       for i from 1 to *n-inputs
       do
       (setf  xi-2-2 (getsymval 'x (list i 2 2))  
              yi-2-2   (/ xi-2-2  L2norm-xi-2-2))
       ;;was (setf v-activity0 (getsymval 'v-activity (list i))  u   (/ v-activity0  L2norm-v))

     ;;CHECK FOR RESET?  (if *reset-F2-p, then if yi-2-2 is max value, reset it.)
    ;;SSSS  IS JUST THE MAX RESET?  ALSO, BETTER RESET X THAN Y??
    (when  *reset-F2-p 
      (multiple-value-bind (max-yi-2-2-index  max-yi-2-2-val)
          (find-largest-nonreset-node 'yi-2-2  :reset-root 'RESETNIN)
        ;;(when (> (getsymval 'resetnin (list i 2 2)) *def-nonresetnin-out-val)                  
        ;;  (setf yi-2-2 *def-reset-xy-val))
        ))

       (setf  yi-2-2-vals (append yi-2-2-vals (list yi-2-2)))     
       
       ;;Set the yi-2-2 value
       (setsymval 'y (list  i 2 2) yi-2-2) 

       ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 3: FIND yi-2-2, FOR i= ~A, ~& u= (/ v-activity0i L2norm-v)= ~A;  xi-2-2init= ~A  L2norm-xi-2-2= ~A" i  xi-2-2init  yi-2-2 L2norm-xi-2-2)))

       ;;end loop
       )
      (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 4.2: FIND yi-2-2-vals=~A  , ~%FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= ~A"   yi-2-2-vals  L2norm-xi-2-2))))




    ;;STEP 4: UPDATE XI-3-2 using INPUTS  YI-2-2 SIGNAL +  F3  YI-1-3,WDN SIGNAL

  ;; Step 4.1: FIND  SUM-F3DN
    ;;find total sum =  (+ sum (* g wdn)) for each input/output
    ;;NOTE: This loop includes inner *no-outputs and *n-inputs loops. 
    ;;NOTE: Outside loop is *n-inputs because target node is ultimately xi-3-2, and there are *n-inputs of them
    (loop
     for i from 1 to *n-inputs
     do
     (setf sum-F3dn  0.0;;SS here or outside i loop??                ;;try 0.0   0.00001)
           sum-F3dn-vals (list "For i= " i)
           sig-yi-1-3-vals (list "For i= " i)
           wdn-vals (list "For i= " i))

     ;;Step 4.1.1  Find the sum-F3dn value for EACH xi-3-2 node
     (loop
      for j from 1 to *n-outputs
      do
      (setf  yi-1-3 (getsymval 'y (list j 1 3))
             sig-yi-1-3  (g  j  'yi-1-3 ) ;;correct
             wdn (getsymval 'wdn (list j 1 3  'TO  i 3 2))
             sum-F3dn (+ sum-F3dn  (* sig-yi-1-3 wdn))
             wdn-vals (append wdn-vals (list wdn))
             sig-yi-1-3-vals (append sig-yi-1-3-vals (list sig-yi-1-3))
             sum-F3dn-vals (append sum-F3dn-vals (list sum-F3dn)))

      ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 1.1: FIND sum-F3dn,  Inside loop (j to *n-outputs), FOR j=~A i= ~s, *n-outputs= ~s ~%,  sum-F3dn= (+ sum-F3dn (* g wdn))= ~A; g= ~A wdn= ~A" j i *n-outputs sum-F3dn g wdn)))

      ;;end loop
      )

 
     ;;Step 4.2: FIND xi-3-2 from yi-2-2 + yi-1-3 its Down Signal= sum-F3dn
     (setf  yi-2-2  (getsymval 'y (list i 2 2))
            xi-3-2  (+ yi-2-2  sum-F3dn)
            xi-3-2-vals (append xi-3-2-vals (list xi-3-2)))

     ;;Set the xi-3-2 value
     (setsymval 'x (list i 3 2) xi-3-2)  

     ;;(if (>  *print-details 1) (afout 'out (format nil  "~%Step 1.2 FIND xi-3-2 FOR i= ~A, ~%xi-3-2=(+ yi-2-2  sum-F3dn)= ~A; yi-2-2= ~A sum-F3dn= ~A" i yi-2-2 xi-3-2 sum-F3dn)))

     ;;end BIG loop (why inner and outer *n-inputs loops? It is like ART2.)
     )
    (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),~% RESULTS sum-F3dn-vals= ~A~% wdn-vals= ~A *n-outputs= ~A,~%FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); ~%sig-yi-1-3-vals= ~A~%"wdn-vals *n-outputs sum-F3dn-vals  sig-yi-1-3-vals))))
     (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 4.2 FIND xi-3-2-vals= ~A~%FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= ~A"  xi-3-2-vals sum-F3dn))))


    ;;STEP 5:FIND yi-3-2  (F2 output) using L2norm-xi-3-2-e

    ;;Step 5.1: Calc xi-3-2  NORM,  L2norm-xi-3-2-e
    (setf  L2norm-xi-3-2  (L2NORM 'xi-3-2 *n-inputs)
           L2norm-xi-3-2-e  (+ L2norm-xi-3-2  e))

    ;;Step 5.2: Calc F2 y outputs  yi-3-2
    (loop
     for i from 1 to *n-inputs
     do
     (setf xi-3-2 (getsymval 'x (list  i 3 2))
           yi-3-2  (/  xi-3-2  L2norm-xi-3-2-e)
           yi-3-2-vals (append yi-3-2-vals (list yi-3-2)))
     ;;was (setf p (getsymval 'p (list  i))      q-activity (/  p  L2norm-p-e))

     (setsymval 'y (list  i 3 2) yi-3-2)
     ;;(if (= *print-details 3) (afout 'out (format nil "~%Step 2: FIND yi-3-2, FOR i= ~A, yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e)= ~A;  xi-3-2= ~A   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= ~A" i yi-3-2 xi-3-2 L2norm-xi-3-2-e)))

     ;;end loop
     )
     (setf  *art-data-text (append *art-data-text (list (format nil "~%Step 5: FIND yi-3-2-vals= ~A, ~%FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= ~A"  yi-3-2-vals  L2norm-xi-3-2-e))))

    ;;STEP 7: UPDATE XI-2-2 
    (loop
     for i from 1 to *n-inputs
     do
     (setf yi-1-2  (getsymval 'y (list i 1 2))
           sig-yi-1-2 (sigmoid yi-1-2)
           yi-3-2 (getsymval 'y (list i 3 2))  ;;must be found here
           sigp-yI-3-2 (* *p2-all (sigmoid  yi-3-2 ))
           xi-2-2 (+ sig-yi-1-2 sigp-yI-3-2)  ;;*p2-all= 10?
           sigp-yI-3-2-vals (append sigp-yI-3-2-vals (list sigp-yI-3-2))
           xi-2-2-vals (append xi-2-2-vals (list xi-2-2)))
     ;;was (setf x-activity  (getsymval 'x-activity(list i))        q-activity (sigmoid (getsymval 'q-activity (list i)))       v-activity (sigmoid (+ x-activity (* b q-activity))))

     ;;Set the xi-2-2 value
     (setsymval 'x (list i 2 2) xi-2-2)  

     ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 4: FIND xi-2-2, FOR i= ~A~%xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)))= ~A;  sigp-yI-3-2= ~A *p2-all= ~A xi-2-2 ~A%" i xi-2-2 sigp-yI-3-2 *p2-all xi-2-2)))

     ;;end loop
     )
     (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 7: FIND xi-2-2-vals= ~A~%FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= ~A  *p2-all= ~A%"  xi-2-2-vals  sigp-yI-3-2-vals  *p2-all ))))


 #| PROBLEM OF VALUES BETW F1 AND F2 NOT STABLIZING--ONLY CALC THSE WITH RESET??
 ;; CALC R  (NOT RESET) -----------------------------------------
   ;;
  ;;STEP 8: CALCULATE  R  USING F1 YI-2-1 AND  F2 YI-2-2

  ;;Step 8.1: Find  F1 max2yi-2-1 (of all yi-2-1) and F2 max1yi-2-2  (of all yi-2-2)
  (multiple-value-setq (max1yI-2-1-index  max1yI-2-1-val)
      (find-largest-ART-ValueIndex 'YI-2-1))
  (multiple-value-setq (max2yI-2-2-index  max2yI-2-2-val)
      (find-largest-ART-ValueIndex 'YI-2-2))

    (setf  *art-data-text (append *art-data-text (list (format nil  "~%STEP 5: FIND  RI,  vector components betw yi-2-1 and yi-2-2~% Step 5.1 Find max1yI-2-1-val  (of all yI-2-3)  and max2yi-2-2-val (of all yI-2-2)~%  max1yI-2-1-val= ~A  max2yI-2-2-val= ~A~%"   max1yI-2-1-val max2yi-2-2-val))))

   ;;Step 8.2: Calc  r  (Precursor to finding reset)
   (setf ri-2-2-vals nil)
   (loop
    for i from 1 to *n-inputs
    do
    ;;do these reflect the cosines of  u, p and r the angle between? 
    (setf yi-2-1 (getsymval 'y (list i 2 1))
          yi-2-2 (getsymval 'y (list i 2 2))
          ri-2-2 (-  (/  yi-2-1   max1yi-2-1-val)  (/ yi-2-2  max2yi-2-2-val)) ;;ri-2-2 replaced r
          ri-2-2-vals (append ri-2-2-vals (list ri-2-2)))

    ;;Set the ri-2-2 value
    (setsymval 'r (list  i 2 2)  ri-2-2)    ;;was (setsymval 'r (list  i)  r)

    ;;end loop
    )
     (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 7.2: FIND  ri-2-2-vals= ~A~%FOR each i;  ri-2-2= (- (/  yi-2-1  max1yi-2-1-val)  (/ yi-2-2  max2yi-2-2-val)) ;   yi-2-1  max1yi-2-1-val= ~A,  yi-2-2  max2yi-2-2-val= ~A~%=========> END  F2-CYCLE -==================%"  ri-2-2-vals  max1yi-2-1  max2yi-2-2  ))))
|#
   ;;(if (> *print-details 0)   (afout 'out (format nil "--------------- END  F2-cycle ------------------%" )))
     ;;return nil, not *art-data-text
     NIL
    ;;end let, F2-cycle
    ))
;; TEST
;; (F2-CYCLE)



;;F3-CYCLE
;;
;;ddd
(defun F3-cycle () 
  "In ART3.lisp, Updates F3 STM values."
  (let
      ((xI-3-2)
       (yI-3-2)
       (xI-1-3)  ;;(w)
       (yI-1-3)  ;; (x-activity)
       (sig-yI-1-3)
       (xI-2-3)  ;; (v-activity)
       (yI-2-3)  ;; (u)
       (sig-yI-2-3)  ;;(sigmoid-u)
       (xI-3-1)  ;; (p)
       (yI-3-1)
       (yI-1-3)  ;; (q-activity)
       (yI-2-2) ;;needed
       (xi-3-3)
       (yi-3-3)
       (xI-2-3) ;;(v-activity0)
      (yI-3-2-vals)
       (xI-1-3-vals)  ;;(w)
       (yI-1-3-vals)  ;; (x-activity)
       (sig-yI-1-3-vals)
       (xI-2-3-vals)  ;; (v-activity)
       (yI-2-3-vals)  ;; (u)
       (sig-yi-2-3)
       (sigp-yi-2-3)
       (sigp-y-3-3)
       (sig-yI-2-3-vals)  ;;(sigmoid-u)
       (sigp-yI-2-3-vals)
       (sigp-yI-3-3-vals)
       (xI-3-1-vals)  ;; (p)
       (yI-3-1-vals)
       (yI-1-3-vals)  ;; (q-activity)
       (yI-2-2-vals) ;;needed
       (xi-3-3-vals)
       (yi-3-3-vals)
       (sum-F3dn 0)
       (sum-F3dn-vals)
       (sum-yi-3-2-up) 
       (sum-yi-3-2-up-vals)
       (g)
       (g-vals)
       (r-vals)
       (ri-2-2)
       (ri-2-2-vals)
       (resetnouti-2-2)
       (L2norm-xI-1-3)     ;;(L2norm-w)
       (L2norm-xI-1-3-e)  ;;(L2norm-w-e) what is this??
       (L2norm-xI-2-3)     ;;(L2norm-v)
       (L2norm-xI-3-1)     ;;(L2norm-p)
       (L2norm-xI-3-1-e)  ;;(L2norm-p-e) ;;??? what is this
       (p0)
       (wup)
       (wdn)
       (wdn-vals)
       (wup-vals)
       (max-yI-2-3)  ;;(max1u)
       (max-xI-3-1)  ;;(max2p)
       (resetnout)
       (resetnout-vals)
       )
   ;;(if (> *print-details 0)  (afout 'out (format nil ">>>>> IN F3-cycle: *art-learn-cycle-n= ~A <<<<<<" *art-learn-cycle-n)))
     (setf  *art-data-text (append *art-data-text (list (format nil ">>>>> IN F3-CYCLE: *art-overall-cycle-n= ~A; *pattern-cycle-n= ~A <<<<<<~%~%"   *art-overall-cycle-n *pattern-cycle-n))))

    ;;NOTE: F2 OUTPUTS  yi-3-2 calculated above in  F2 Step 6.2: Calc F2 y outputs  yi-3-


   ;;FIELD 3
   ;;STEP 1: Find F3 INPUT ACTIVITY, XI-1-3 =  (+ sum-yi-3-2-up (*  *p3-all  (sigmoid  yi-2-3))
   ;;In F3, *n-outputs x or y nodes in each layer, use j instead of i for actual node variables.
   (loop 
    for j from 1 to *n-outputs  ;;was i SS is i or j on outside loop? For EACH j, sums across all yi-3-2s
    do

    ;;Step 1.1 Find the  SUM-YI-3-2-UP for EACH XJ-1-3 F3 input node
    (setf sum-yi-3-2-up 0.0
          sum-yi-3-2-up-vals (list "For j= " j)
          wup-vals  (list "For j= " j));;SS here or outside i loop??
   (loop
     for i from 1 to *n-inputs
     do 
     ;;Test synapse been reset (SSS CHK FOR RESET ON WUP or just WDN??)   


     ;;not needed here? Sj-2-3 (g 'yI-2-3))))

     (setf yi-3-2  (getsymval 'y (list i 3 2))
           wup (getsymval 'wUp (list  i 3 2 'to j 1 3))  ;;was wUpi-3-2toj-1-3
           sum-yi-3-2-up  (+ sum-yi-3-2-up  (* yi-3-2  wup ))
           yi-3-2-vals (append yi-3-2-vals (list yi-3-2))
           wup-vals (append wup-vals (list wup))
           sum-yi-3-2-up-vals (append sum-yi-3-2-up-vals (list sum-yi-3-2-up)))    
     ;;end inner loop, was just above outer j loop
        )

     ;;(if (= *print-details  3) (afout 'out (format nil "~%Step 1:FIND sum-yi-3-2-up, For j= ~A, i= ~A;~%sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp ))= ~A, wup= ~A wUpi-3-2toj-1-3= ~A" j i sum-yi-3-2-up yi-3-2 wup)))
     ;;UNQUOTE FOLLOWING IF WANT DETAILS ON FINDING EACH SUM-YI-3-2-UP
     ;;(setf  *art-data-text (append *art-data-text (list (format nil "~%BEGIN F3-CYCLE~%STEP 1:FIND sum-yi-3-2-up-vals= ~A;~%yi-3-2-vals= ~A~% FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),~% wup-vals= ~A;~% wUpi-3-2toj-1-3~%F3-INPUT: xI-1-3-vals= ~A~%"  yi-3-2-vals  sum-yi-3-2-up-vals  wup-vals  xI-1-3-vals))))

     ;;Step 1.2:  Adjust INPUTS xI-1-3 for RESET ;; do it only in RESET--not work?
     ;;Done in reset, but prevents recalc increasing value
     (when
      (or *reset-XI-1-3-p *reset-all-f3layer-maxs-p)
       (setf  resetnout (test-xy-node-reset 'x (list j 1 3));;was (getsymval 'resetnout (list j 2 2))
              resetnout-vals (append resetnout-vals (list resetnout))))
      
      ;;Step 1.3: SET F3 xi-1-3 input  to sum-yi-3-2-up IF  NO RESET,
      ;;Set the new xI-1-3 value if not reset
      (when
          (or (null resetnout) (not (= resetnout *def-reset-xy-val)))
        (setf  yI-2-3 (test-xy-node-reset  'y (list j 2 3) :t-return-get-val-p T :t-return-val *def-y-testout-val))
        (setf sigp-yI-2-3  (*  *p3-all  (sigmoid  yi-2-3))
               xi-1-3   (+  sum-yi-3-2-up  sigp-yI-2-3)
               ;;(my-floor-ceiling sum-yi-3-2-up  :floor *y-output-floor :ceiling *y-output-ceiling)  ;;-100 to 1000
               sigp-yI-2-3-vals (append sigp-yI-2-3-vals (list sigp-yI-2-3))
               xI-1-3-vals (append xI-1-3-vals (list xI-1-3)))

        (setsymval 'x (list  j 1 3) xI-1-3)
        ;;end when not reset 
        )

    ;;end Outer loop, Setting INPUTS to F3-cycle
    )
          (setf  *art-data-text (append *art-data-text (list (format nil "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;~%  xI-1-3-vals= ~A ~%FOR  resetnout-vals= ~A~%~%Step 1.1: FIND sum-yi-3-2-up-vals= ~A;~% FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),~% FOR sigp-yI-2-3-vals= ~A;~% Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  ~%*F3-compet-every-nth-time-interval= ~A~%"xI-1-3-vals   resetnout-vals   sum-yi-3-2-up-vals  sigp-yI-2-3-vals *F3-compet-every-nth-time-interval ))))


    ;;ON-CENTER, OFF-SURROUND COMPETITION IN F3, LAYERS 1, 3?
    (when (and *F3L1-compet-p (numberp *F3-compet-every-nth-time-interval))
      (when 
          (whole-number-p (/  *pattern-cycle-n  *F3-compet-every-nth-time-interval))
        (competitive-F-output  'XI-1-3 :n-nodes *n-outputs)
        (competitive-F-output  'XI-3-3 :n-nodes *n-outputs) ))
 
;;-- BEGIN MOVED HERE FROM AFTER F3-CYCLE
 ;;F3, L3 COMPETITIVE-F-OUTPUT ONLY IF "CHOICE" ALL-OR-NONE F3 MODEL
  (when (and *F3-all-or-none-competative-output-p 
             (numberp *F3-compet-every-nth-time-interval))
    (when (or 
           (whole-number-p (/ *pattern-cycle-n *F3-compet-every-nth-time-interval)) 
           (member *overall-cycle-n *test-compet-overall-cycle-nums-list))
      (setf *art-data-text (append *art-data-text (list (format nil ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"))))
      ;;SS WHERE TO COMPETE IN F3, L1,2,3?? 
      ;; PUT COMPET L1 INSIDE F3-CYCLE
      ;;TRY BOTH L1, L3;; ALSO X VS Y
      ;;not needed? 
      (competitive-F-output  'XI-3-3 :n-nodes *n-outputs)
      (competitive-F-output  'YI-3-3 :n-nodes *n-outputs) )
    ;;end when *F3...
    )
;; END MOVED HERE -----------
           

    ;;STEP 2: UPDATE YI-1-3 USING XI-1-3, L2NORM-XI-1-3  
    ;;Step 2.1 Find normalized y's
    (setq L2norm-xI-1-3 (L2NORM  'xI-1-3 *n-outputs) 
          L2norm-xI-1-3-e (+ L2norm-xI-1-3  e))

    ;;(if (> *print-details 1) (afout 'out (format nil "~%Step 6: FIND x-activity,~%Step 6.1 UPDATE L2norm-xI-1-3-e=  ~A after w loop:~%; L2norm-xI-1-3= ~A " L2norm-w-e  L2norm-xI-1-3)))
    ;;was (if (> *print-details 1) (afout 'out (format nil "~%Step 6: FIND x-activity,~%Step 6.1 UPDATE L2norm-w-e=  ~A after w loop:~%; L2norm-w= ~A " L2norm-w-e L2norm-w)))
     (setf  *art-data-text (append *art-data-text (list (format nil "~%STEP 2: FIND YI-1-3~% FIND ~% Step 2.1: Find  L2norm-xI-1-3-e=  ~A after w loop:~%; L2norm-xI-1-3= ~A~% " L2norm-xI-1-3-e  L2norm-xI-1-3))))

    ;;Step 2.2: Find the normalized f3 inputs yi-1-3
    (loop
      for j from 1 to *n-outputs
      do
      (setf  xI-1-3 (getsymval 'x (list j 1 3)))
      (cond
       ((= xi-1-3 *def-reset-xy-val)
        (setf xI-1-3-vals (append xI-1-3-vals (list xI-1-3))))
       (t
        (setf  yI-1-3   (/  xI-1-3  L2norm-xI-1-3)
               xI-1-3-vals (append xI-1-3-vals (list xI-1-3))
               yI-1-3-vals (append yI-1-3-vals (list yI-1-3)))

        ;;Set the yI-1-3 value
        (setsymval 'y (list  j 1 3) yI-1-3)
        ;;end t cond
        ))

      ;;end *n-outputs loop
      )
    #|(loop
     for j from 1 to *n-outputs
     do    
     (setf xI-1-3  (getsymval 'x (list  j 1 3))
           yI-1-3   (/ xI-1-3  L2norm-xI-1-3-e )
           ;;was (my-floor-ceiling (/ xI-1-3  L2norm-xI-1-3-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling)
          ;; redundant xi-1-3-vals (append xi-1-3-vals (list xi-1-3))
           yi-1-3-vals (append yi-1-3-vals (list yi-1-3)))

     ;;Set new yI-1-3 value
     (setsymval 'y (list  j 1 3) yI-1-3) 
 
     ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 6.2 FIND yI-1-3, FOR J= ~s~% x-activity i=(my-floor-ceiling (/ w  L2norm-w-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling)= ~s; xI-1-3= ~A   L2norm-w-e= ~s " j yI-1-3 xI-1-3  L2norm-xI-1-3-e)))

     ;;end loop
     )|#
     (setf  *art-data-text (append *art-data-text (list (format nil  "~%STEP 2.2 FIND PRE-COMPET yI-1-3-vals= ~A;~% FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= ~s "  yi-1-3-vals     L2norm-xI-1-3-e))))


     ;;STEP 2.3: COMPETITIVE-F-OUTPUT (appends *art-data-text)
     (competitive-F-output  'xi-1-3  :n-nodes *n-outputs)
     (competitive-F-output  'yi-1-3  :n-nodes *n-outputs)  ;;:add-data-text-p T)
     

   ;;STEP 3: UPDATE XI-2-3 INCL CHECK FOR RESET
   ;;CHECK FOR RESET  ;;now done in Test-reset
   ;;Step 1.2:  Adjust INPUTS xi-2-3 for RESET ;; do it only in RESET--not work?
     ;;Done in reset, but prevents recalc increasing value
     (setf resetnout-vals nil)
     (loop
      for j from 1 to *n-outputs
      do
    (when
      (or *reset-XI-2-3-p *reset-all-f3layer-maxs-p)
       (setf  resetnout (test-xy-node-reset 'x (list j 1 3));;was (getsymval 'resetnout (list j 2 2))
              resetnout-vals (append resetnout-vals (list resetnout))))
      
      ;;Step 1.3: SET F3 xi-2-3 input  to sum-yi-3-2-up IF  NO RESET,
      ;;Set the new xi-2-3 value if not reset
      (when
          (or (null resetnout) (not (= resetnout *def-reset-xy-val)))
        (setf  yI-2-3 (test-xy-node-reset  'y (list j 2 3) :t-return-get-val-p T :t-return-val *def-y-testout-val))
        (setf sigp-yI-2-3  (*  *p3-all  (sigmoid  yi-2-3))
               xi-2-3   (+  sum-yi-3-2-up  sigp-yI-2-3)
               ;;(my-floor-ceiling sum-yi-3-2-up  :floor *y-output-floor :ceiling *y-output-ceiling)  ;;-100 to 1000
               sigp-yI-2-3-vals (append sigp-yI-2-3-vals (list sigp-yI-2-3))
               xi-2-3-vals (append xi-2-3-vals (list xi-2-3)))

        (setsymval 'x (list  j 2 3) xi-2-3)
        ;;end when not reset
        )

      ;;end loop
      )

      (setf  *art-data-text (append *art-data-text (list (format nil  "~%STEP 3: FIND xi-2-3-vals= ~A~%  sig-yi-1-3-vals= ~A~%;   sigp-yI-3-3-vals= ~A  *p2-all= ~A%"  xi-2-3-vals  sig-yi-1-3-vals sigp-yI-3-3-vals  *p2-all ))))

    ;;STEP 4: UPDATE YI-2-3  USING XI-2-3 AND NORM-XI-2-3
     (setf  L2norm-xI-2-3 (L2NORM  'xI-2-3  *n-outputs))
     (setf xI-2-3-vals nil)

     (loop
      for j from 1 to *n-outputs
      do
      (setf  xI-2-3 (getsymval 'x (list j 2 3)))
      (cond
       ((= xi-2-3 *def-reset-xy-val)
        (setf xI-2-3-vals (append xI-2-3-vals (list xI-2-3))))
       (t
        (setf  yI-2-3   (/  xI-2-3  L2norm-xI-2-3)
               xI-2-3-vals (append xI-2-3-vals (list xI-2-3))
               yI-2-3-vals (append yI-2-3-vals (list yI-2-3)))

        ;;Set the yI-2-3 value
        (setsymval 'y (list  j 2 3) yI-2-3)
        ;;end t cond
        ))

      ;;end *n-outputs loop
      )

     #|old (loop
      for j from 1 to *n-outputs
      do
      (setf  xI-2-3 (getsymval 'x (list j 2 3))  
             yI-2-3   (/  xI-2-3  L2norm-xI-2-3)
             xI-2-3-vals (append xI-2-3-vals (list xI-2-3))
             yI-2-3-vals (append yI-2-3-vals (list yI-2-3)))

      ;;Set the yI-2-3 value
      (setsymval 'y (list  j 2 3) yI-2-3) 
      ;;end loop
      )|#

     (setf  *art-data-text (append *art-data-text (list (format nil  "~%STEP 4: FIND  yI-2-3-vals= ~A;~%  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);~% xI-2-3-vals= ~A~% L2norm-xI-2-3= ~A~% "   yI-2-3-vals xI-2-3-vals L2norm-xI-2-3 ))))


  ;;STEP 5: UPDATE XI-3-3
(loop
     for j from 1 to *n-outputs
     do
     (when *reset-XI-3-3-p
       (setf  resetnout (test-xy-node-reset (list j 3 3)) ;; (getsymval 'resetnout (list j 2 2))
              resetnout-vals (append resetnout-vals (list resetnout))))

     (cond
      ((and resetnout (> resetnout *def-nonresetnin-out-val))  ;;was (= resetnout *def-reset-val)
       NIL)
      (t
       (setf  yI-1-3 (test-xy-node-reset  'y (list j 1 3) :t-return-get-val-p T :t-return-val *def-y-testout-val)
              yI-3-3 (test-xy-node-reset  'y (list j 3 3) :t-return-get-val-p T :t-return-val *def-y-testout-val))
       (setf sig-yi-1-3 (sigmoid yi-1-3)
             sigp-yI-3-3 (* *p3-all (sigmoid  yi-3-3 ))
             xi-3-3 (+ sig-yi-1-3 sigp-yI-3-3)) ;;*p2-all= 10?

       (setf sig-yi-1-3-vals (append sig-yi-1-3-vals (list sig-yi-1-3))
             sigp-yI-3-3-vals (append sigp-yI-3-3-vals (list sigp-yI-3-3))
             xi-3-3-vals (append xi-3-3-vals (list xi-3-3)))

       ;;Set the xi-2-2 value
       (setsymval 'x (list j 3 3) xi-3-3)
       ;;end t cond
       ))

     ;;end loop
     )
   #|older (loop
     for j from 1 to *n-outputs
     do
     (setf yi-2-3  (getsymval 'y (list j 2 3))
           sig-yI-2-3 (sigmoid  yI-2-3)
           xi-3-3    sig-yI-2-3
           xI-3-3-vals (append xI-3-3-vals (list xI-3-3))
           sig-yI-2-3-vals (append sig-yI-2-3-vals (list sig-yI-2-3)))

     ;;CHECK FOR RESET
     (when *reset-XI-3-3-p
       (setf  resetnout (getsymval 'resetnout (list j 2 2))
              resetnout-vals (append resetnout-vals (list resetnout)))
       (when
        (> resetnout *def-nonresetnin-out-val) 
         (setf xi-3-3 *def-reset-xy-val)))

     ;;Set the xi-3-3 value
     (setsymval 'x (list j 3 3) xI-3-3)  ;;was (setsymval 'v-activity (list j) v-activity)

     ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 4: FIND xi-3-3, FOR J= ~A~%xi-3-3= (sigmoid (+ yI-1-3 (* b yI-3-1)))= ~A;  xi-3-3= ~A b= ~A yI-3-1= ~A%" j xi-3-3 yI-1-3 b yI-3-1)))

     ;;end *n-outputs loop
     )|#
          (setf  *art-data-text (append *art-data-text (list (format nil  "~%STEP 5: FIND xI-3-3-vals= ~A,~% FOR  xI-3-3=  (sigmoid yi-2-3));~%  sig-yI-2-3-vals=  ~A~% "  xI-3-3-vals   sig-yI-2-3-vals  ))))

     ;;STEP 6: UPDATE YI-3-3  USING XI-3-3 AND NORM-XI-3-3
     ;;Step 3: Update yI-3-3  using xI-3-3 and norm-xI-3-3
     ;;was Update u using v-activity and norm-v (Watson eq. 6:)
     (setf  L2norm-xI-3-3 (L2NORM  'xI-3-3  *n-outputs))
     ;;was (setf  L2norm-v (L2NORM  'v-activity  *n-inputs))

     (setf xI-3-3-vals nil
            sum-F3dn-vals nil)

     (loop
      for j from 1 to *n-outputs
      do
      (setf  xI-3-3 (getsymval 'x (list j 3 3)))
      (cond
       ((= xi-3-3 *def-reset-xy-val)
        (setf xI-3-3-vals (append xI-3-3-vals (list xI-3-3))))
       (t
        (setf  yI-3-3   (/  xI-3-3  L2norm-xI-3-3)
               xI-3-3-vals (append xI-3-3-vals (list xI-3-3))
               yI-3-3-vals (append yI-3-3-vals (list yI-3-3)))

        ;;Set the yI-3-3 value
        (setsymval 'y (list  j 3 3) yI-3-3)
        ;;end t cond
        ))

      ;;end *n-outputs loop
      )
          (setf  *art-data-text (append *art-data-text (list (format nil  "~%STEP 6: FIND  yI-3-3-vals= ~A;~%  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);~% xI-3-3-vals= ~A~% L2norm-xI-3-3= ~A~% "   yI-3-3-vals xI-3-3-vals L2norm-xI-3-3 ))))

        (setf  *art-data-text (append *art-data-text (list (format nil "~%============> END  F3-cycle =======================%"))))
     ;;return nil, not *art-data-text
     NIL
    ;;end let, F3-cycle
    ))
;;TEST
;;  (F3-CYCLE)
;; 



;;UPDATE-X-Y-NODE-VALUES
;;
;;ddd
(defun update-x-y-node-values (x-sym y-sym &key (n-nodes *n-outputs) reset-check-p)
  "ONLY WORKS FOR XI-3-3, YI-3-3 NOW. FIX FOR MORE? Updates x and y nodes, copied from F3, so can update x and y values after competition without repeat all code.  Also this is a test functi on for later using to calc x and y values for all/most fields?"
  (let
      ((yi-2-3)  
       (sig-yI-2-3) 
       (xi-3-3)  
       (yi-3-3)
       (xI-3-3-vals)
       (yI-3-3-vals)
       (sig-yI-2-3-vals) 
       (resetnout) 
       (resetnout-vals) 
       (L2norm-xI-3-3) 
       (sum-F3dn-vals)
       )

    (when
        (and (equal x-sym 'xi-3-3)(equal y-sym 'yi-3-3))

      ;;STEP 5: UPDATE XI-3-3
      (loop
       for j from 1 to n-nodes
       do
       (setf  yI-2-3 (test-xy-node-reset  'y (list j 2 3) :t-return-get-val-p T :t-return-val *def-y-testout-val))
             (setf sig-yI-2-3 (sigmoid  yI-2-3)
             xi-3-3    sig-yI-2-3
             xI-3-3-vals (append xI-3-3-vals (list xI-3-3))
             sig-yI-2-3-vals (append sig-yI-2-3-vals (list sig-yI-2-3)))
;;zzzz
       ;;CHECK FOR RESET - no done in test-reset now
       (when reset-check-p ;;normally nil now
         (setf  resetnout (test-xy-node-reset (j 3 3));; (getsymval 'resetnout (list j 2 2))
                resetnout-vals (append resetnout-vals (list resetnout)))
         (when
              (>  resetnout *def-nonresetnin-out-val)  ;;was (=  resetnout *def-reset-val)
           (setf xi-3-3 *def-reset-xy-val)))

       ;;Set the xI-3-3 value
       (setsymval 'x (list j 3 3) xI-3-3)  ;;was (setsymval 'v-activity (list j) v-activity)

       ;;end n-nodes loop
       )
      (setf  *art-data-text (append *art-data-text (list (format nil  "~%>>> IN UPDATE-X-Y-NODE-VALUES~% STEP 1: FIND xI-3-3-vals= ~A,~% FOR  xI-3-3=  (sigmoid yi-2-3));~%  sig-yI-2-3-vals=  ~A~% "  xI-3-3-vals   sig-yI-2-3-vals  ))))

      ;;STEP 6: UPDATE YI-3-3  USING XI-3-3 AND NORM-XI-3-3
      ;;Step 3: Update yI-3-3  using xI-3-3 and norm-xI-3-3
      (setf  L2norm-xI-3-3 (L2NORM  'xI-3-3  n-nodes))

      ;;reset
      (setf xI-3-3-vals nil
            sum-F3dn-vals nil)

      (loop
       for j from 1 to n-nodes
       do
       (setf  xI-3-3 (getsymval 'x (list j 3 3))  
              yI-3-3   (/  xI-3-3  L2norm-xI-3-3)
              xI-3-3-vals (append xI-3-3-vals (list xI-3-3))
              yI-3-3-vals (append yI-3-3-vals (list yI-3-3)))

       ;;Set the yI-3-3 value 2
       (setsymval 'y (list  j 3 3) yI-3-3) 

       ;;end n-nodes loop
       )
      (setf  *art-data-text (append *art-data-text (list (format nil  "~%STEP 2: FIND  yI-3-3-vals= ~A;~%  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);~% xI-3-3-vals= ~A~% L2norm-xI-3-3= ~A~% "   yI-3-3-vals xI-3-3-vals L2norm-xI-3-3 ))))

      ;;end when x, y 
      )
    NIL
    ;;end let, update-x-y-node-values
    ))
;;TEST
;;  (update-x-y-node-values 'XI-3-3 'YI-3-3)













;; ART3 DOESN'T REALLY HAVE EQUIVALENT OF ART2 FIELD 2
;;   ART3 IS MORE LIKE 3 ART2 FIELD1's
;;ddd
#| NOT USED IN ART3??
(defun F2STMcycle (*n-inputs *n-outputs) ;;&aux i j sum)
  "In ART3.lisp,Updates F2 STM storage"
  (let
      ((i)
       (j)
       (sum-p-wup)
       (p)
       (wup)
       (y-output)
       (reset) ;;this--current
      ;; (r)  ;;or this??
       )
   (afout 'out (format nil ">>>>> IN F2STMcycle: *art-learn-cycle-n= ~A <<<<<<" *art-learn-cycle-n))
   ;;F2 Step 1: Find pre reset  y-output= 
  (loop 
   for j from 1 to *n-outputs
   do
     (setq sum-p-up 0.0)
     ;;1.1 
     (loop
      for i from 1 to *n-inputs
      do
      (setf p  (getsymval 'p (list i))
            wUp (getsymval 'wUp (list  i j))
            sum-p-up  (+ sum-p-up (* p  wUp )))
     ;;(if (= *print-details  3) (afout 'out (format nil "~%Step 1:FIND sum-p-up, For j= ~A, i= ~A;~%sum-p-up=(+ sum-p-up (* p  wUp ))= ~A, p= ~A wUp= ~A" j i sum-p-up p wup)))
       ;;end inner loop
       )
     ;;Step 2: Set y-output to sum if  no reset, limit with my-floor-ceiling
     (setf y-output
           (my-floor-ceiling  sum-p-up :floor *y-output-floor :ceiling *y-output-ceiling))  ;;-100 to 1000
     (setf  reset (getsymval 'reset (list j)))

     (if (> reset 0) (setsymval 'y-output (list  j)  0.0001)
       (setsymval 'y-output (list  j) y-output))
     (if (> *print-details  1) (afout 'out (format nil  "In F2STMcycle, Step 2: FIND y-output FOR j= ~A,  y-output=~a ; reset= ~A"  j  y-output reset )))

   ;;end loop, F2STMcycle
   )
  ;;end let, F2STMcycle
  ))|#



;;COMPETITIVE-F-OUTPUT
; Competitive learning at slab F2 and/or F3??
;;ddd
(defun competitive-F-output (outvar-sym &key (n-nodes *n-outputs) 
                                        (add-data-text-p T) 
                                        (default-val *def-compet-val) )  ;;*def-compet-val= 0.01
  "In ART3.lisp, Calculates competitive learning at layer 3 for relevant fields. *onCenterThreshold [Watson used term resetThreshold, but misnomer bec really is competition winner--on-center, off-surround] RETURNS (values y-max-index y-max-value )"

  (let
      ((rest-dims)
       (maxdims)
       (reset-root)
       (reset-dims)
       (outvar-vals)
       )
    ;;DETERMINE RESET-ROOT
    (cond
     ((= n-nodes *n-outputs)
      (setf reset-root 'resetnout))
     (t (setf reset-root 'resetnin)))
       
    (multiple-value-bind (y-max-index y-max-value)
        (find-largest-nonreset-node outvar-sym :reset-root reset-root)        ;;was 'y-output) ;;now yi-3-3

      (multiple-value-bind (dims-list rootstr )
          (find-art-dims outvar-sym)
        (setf rest-dims (cdr dims-list)
              maxdims (append (list y-max-index) rest-dims))


        ;;Sets all other y's to 1, if largest y > *onCenterThreshold
        (cond
         ((>  y-max-value  *onCenterThreshold) ;; 0.25 
          ;;eliminates noise by surpressing y-outputs with low values, sets y to .00001
          (loop
           for j from 1 to n-nodes  
           do
           (cond
            ;;(max,non-reset stays same)
            ((= j y-max-index)
             (setf outvar-vals (append outvar-vals (list y-max-value)))

             )
            ;;set non-max (or reset) values to default-val 
            (t
             (setsymval rootstr (append (list j) rest-dims) default-val)
             (setf outvar-vals (append outvar-vals (list default-val)))))
           ;;not necessary 0.00001))  ;;was 'y-output
     
           ;;was (setf *art-data-text (append *art-data-text (list  "-----> IN competitiveF2, For j= ~A y-output= ~A" j (getsymval 'y-output (list j)))))
           )
          ;;end loop, clause  >  y-max-value  *onCenterThreshold)
          )
         (t  (setf outvar-vals (nth-value 1 (get-art-bottomsym-values outvar-sym)))))

       ;; (if (> *print-details 0)(afout 'out (format nil "-----> IN competitiveF2, y-max-index= ~A, y-max-value= ~A  *onCenterThreshold= ~A" y-max-index y-max-value *onCenterThreshold )))
       (when add-data-text-p
         (setf *art-data-text (append *art-data-text (list (format nil "~%===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= ~A ~%FOR n-nodes= ~A; y-max-index= ~A y-max-value ~A;   *onCenterThreshold= ~A~%POST-COMPET ~A-vals= ~A~%" *overall-cycle-n  n-nodes y-max-index y-max-value   *onCenterThreshold outvar-sym outvar-vals)))))
 
        (values y-max-index y-max-value) 
        ;;end mvbs, let, competitiveF2
        ))))
;;TEST
;;  (competitive-F-output 'yi-1-3 )
;;  (competitive-F-output 'yi-3-1 :n-nodes *n-inputs )
;; (competitive-F-output 'yi-1-3 :n-nodes *n-outputs :add-data-text-p T)
#|===> IN COMPETITIVE-F-OUTPUT; 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.4621165;   *onCenterThreshold= 0.25
POST-COMPET outvar-vals= (0.0 0.0 0.0 0.0 0.4621165)|#



;;TEST-RESET
; Check for an F2 reset condition:
 (setq *skip-reset nil)
;;
;;ddd
(defun test-reset (&key (n-inputs *n-inputs) (n-outputs *n-outputs)
                        (vigilance *vigilance) (compare-layers  *reset-compare-layers)
                        (recalc-F3L1xy-postreset-p *recalc-F3L1xy-postreset-p))  
;;was, replace in let* &aux (res 0.0) (norm1 0.0) (norm2 0.0)  (n1 (+ (L2NORM p n-inputs) e)) n2 temp) uses &aux instead of let??
  "In ART2.lisp, Used in One INPUT NOT one cycle--causes flip-flop if one cycle.  Checks for an F2 reset condition.  "
;;Steele-Nothing can bedone with &aux variables that cannot be done with the special form let*:
(let*
    ((res 0.0)
     (norm1 0.0001) ;;avoid 0?
     (norm2 0.0001) ;;avoid 0?
     ;;p = signal from inputs
     (l2norm-yi-1-1 (L2NORM 'yi-1-1  *n-inputs))
     ;;was (l2norm-yi-2-2 (L2NORM 'yi-2-2 *n-inputs)) ;;(l2norm-p (L2NORM 'p n-inputs))  ;;eg p=(P0 P1 P2 P3 P4)
     (l2norm-yi-1-1-e (+ l2norm-yi-1-1  e))
     ;;was (l2norm-yi-2-2-e (+ l2norm-yi-2-2 e)) ;; (n1 (+  l2norm-p  e)) ;;e= .04?
     (n2)
     (temp)
     (l2norm-r)
     ;;this is reset on each testReset
     (was-reset-p)
     (reset-x-coord) 
     ;;(F2y-max-value)
     ;;(F2y-max-Index)
     (max1yI-2-1-index)
     (max1yI-2-1-val)
     (max2yI-2-2-index)
     (max2yI-2-2-val)
     ;;use for testing YI-1-1 VS YI-1-2
     (max1yI-1-1-index)
     (max1yI-1-1-val)
     (max2yI-1-2-index)
     (max2yI-1-2-val)
     (yi-1-1)
     (yi-1-2)
     (yi-1-1-vals)
     (yi-1-2-vals)
     (max1yi-1-1)
     ;;end for testing YI-1-1 VS YI-1-2
     (F3y-max-value)
     (F3y-max-Index)
     (max-XI-1-3)
     (max-XI-2-3)
     (max-XI-3-3)
     (max-YI-1-3)
     (max-YI-2-3)
     (max-YI-3-3)
     (yi-2-1)
     (yi-2-2)
     (xI-1-3)  
     (yI-1-3)
     (yi-2-1-vals)
     (yi-2-2-vals)
     (yi-1-3-vals)
     ;;not used (resetnini-2-2)
     ;; (resetnouti-2-2)
     (resetnini-2-2-vals)
     (ri-2-2)
     (ri-2-2-vals)
     (resetnouti-2-2-vals)
     (cycle-reset-info)
     (cycle-reset-info1)       
     (cycle-reset-info2)
     ;;(cycle-reset-info3)
     )
  ;;(if (=  *print-detail 0)(afout 'reset-info (format nil ">>>>NEW-CYCLE: In TESTRESET 1, *pattern-cycle-n= ~A~%   n1=(+  l2norm-p e)=  ~A, l2norm-p= ~A e= ~A  *skip-reset= ~A" *pattern-cycle-n n1  l2norm-p  e  *skip-reset)))
  ;; (afout 'out (format nil "~%>>>> CYCLE INITIAL RESET-INFO: ~A"cycle-reset-info1) )


  ;;STEP 1: FIND RI-2-2 VALUES  (USING F1 YI-2-1 AND  F2 YI-2-2)
  ;;Step 1.1: Find  F1 max2yi-2-1 (of all yi-2-1) and F2 max1yi-2-2  (of all yi-2-2)
  (cond
   ((= compare-layers 1)
    (multiple-value-setq (max1yI-1-1-index  max1yI-1-1-val)
        (find-largest-ART-ValueIndex 'YI-1-1))
    (multiple-value-setq (max2yI-1-2-index  max2yI-1-2-val)
        (find-largest-ART-ValueIndex 'YI-1-2))
    (setf  *art-data-text (append *art-data-text (list (format nil  "~%>>>>>> IN TEST-RESET  *overall-cycle-n= ~A >>>>~%STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2~% Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)~%  max1yI-1-1-val= ~A  max2yI-1-2-val= ~A~%" *overall-cycle-n  max1yI-1-1-val max2yi-1-2-val))))
    )
   ((= compare-layers 2)
    (multiple-value-setq (max1yI-2-1-index  max1yI-2-1-val)
        (find-largest-ART-ValueIndex 'YI-1-1))
    (multiple-value-setq (max2yI-2-2-index  max2yI-2-2-val)
        (find-largest-ART-ValueIndex 'YI-2-2))
    (setf  *art-data-text (append *art-data-text (list (format nil  "~%>>>>>> IN TEST-RESET  *overall-cycle-n= ~A >>>>~%STEP 1: FIND  RI,  vector components betw yi-2-1 and yi-2-2~% Step 5.1 Find max1yI-2-1-val  (of all yI-2-3)  and max2yi-2-2-val (of all yI-2-2)~%  max1yI-2-1-val= ~A  max2yI-2-2-val= ~A~%" *overall-cycle-n  max1yI-2-1-val max2yi-2-2-val))))
    )
   (t nil))
  
  ;;COMPARE F1vsF2 LAYERS (1 or 2?) to test reset
  (cond
   ((= compare-layers 1)
    ;;Step 1.2: Calc  r  (Precursor to finding reset)
    (setf ri-2-2-vals nil)
    (loop
     for i from 1 to *n-inputs
     do
     ;;do these reflect the cosines of  u, p and r the angle between? 
     (setf yi-1-1 (getsymval 'y (list i 2 1))
           yi-1-2 (getsymval 'y (list i 2 2))
           yi-1-1-vals (append yi-1-1-vals (list yi-1-1))
           yi-1-2-vals  (append yi-1-2-vals (list yi-1-2))                
           ri-2-2 (-  (/  yi-1-1   max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;;ri-2-2 replaced r
           ri-2-2-vals (append ri-2-2-vals (list ri-2-2)))

     ;;Set the ri-2-2 value
     (setsymval 'r (list  i 2 2)  ri-2-2)    ;;was (setsymval 'r (list  i)  r)

     ;;end loop
     )
    (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 1.2: FIND  ri-1-2-vals= ~A~%FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= ~A,  yi-1-2  max2yi-1-2-val= ~A~% WHERE yi-1-1-vals= ~A~%         and yi-1-2-vals= ~A"  ri-2-2-vals  max1yi-1-1-val  max2yi-1-2-val yi-1-1-vals yi-1-2-vals ))))
    )
   ((= compare-layers 2)
    ;;Step 1.2: Calc  r  (Precursor to finding reset)
    (setf ri-2-2-vals nil)
    (loop
     for i from 1 to *n-inputs
     do
     ;;do these reflect the cosines of  u, p and r the angle between? 
     (setf yi-2-1 (getsymval 'y (list i 2 1))
           yi-2-2 (getsymval 'y (list i 2 2))
           yi-2-1-vals (append yi-2-1-vals (list yi-2-1))
           yi-2-2-vals  (append yi-2-2-vals (list yi-2-2))                
           ri-2-2 (-  (/  yi-2-1   max1yi-2-1-val)  (/ yi-2-2  max2yi-2-2-val)) ;;ri-2-2 replaced r
           ri-2-2-vals (append ri-2-2-vals (list ri-2-2)))

     ;;Set the ri-2-2 value
     (setsymval 'r (list  i 2 2)  ri-2-2)    ;;was (setsymval 'r (list  i)  r)

     ;;end loop
     )
    (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 1.2: FIND  ri-2-2-vals= ~A~%FOR each i;  ri-2-2= (- (/  yi-2-1  max1yi-2-1-val)  (/ yi-2-2  max2yi-2-2-val)) ;   yi-2-1  max1yi-2-1-val= ~A,  yi-2-2  max2yi-2-2-val= ~A~% WHERE yi-2-1-vals= ~A~%         and yi-2-2-vals= ~A"  ri-2-2-vals  max1yi-2-1-val  max2yi-2-2-val yi-2-1-vals yi-2-2-vals ))))
    )
   (t nil))
  ;;END OF CHOICE BETWEEN COMPARE F1-F2,L1s  OR  F1-F2,L2s


   ;;STEP 2:  TEST FOR ADEQUATE INPUT to test for reset and not *skip-reset
  (cond
   ((and (> l2norm-yi-1-1-e *min-input-criteria)  ;; (> n1 *min-input-criteria) ;;was  0.2) ;;was l2norm-yi-2-2-e
         (not *skip-reset))
     
    ;;Step 1a. When NOT on first cycle
    (when
        (> *pattern-cycle-n 1) ;; (> *tdelta-cycle-n  1)  ;;(> learningCycleCounter 1) 

      ;;STEP 3: FIND   L2NORM-R
      (setf  l2norm-r  (L2NORM  'ri-2-2  n-inputs)) 

      ;;Step 3.1 Find the largest F3? Y OUTPUT VALUE AT L1, L2, L3, OR ALL 3?
      (cond
       (*find-Yi-3-3-max-output-p
        (multiple-value-setq (F3y-max-Index F3y-max-value)
            (find-largest-node 'yi-3-3 *n-outputs)))       ;; (findLargestOutput)
       (*find-Yi-1-3-max-output-p
        (multiple-value-setq (F3y-max-Index F3y-max-value)
            (find-largest-node 'yi-1-3 *n-outputs) ))
       (t nil))

      ;;STEP 4. TEST ON-CENTER y-output must exceed  *reset-y-criteria = .25?
      ;; AND FIND RES
      (cond
       ((> F3y-max-value  *reset-y-criteria)  ;; 0.4 in ART3? ;;0.2, orig= 0.25
        ;;set RES based upon wdn signal norm
        (setf res  (*  *vigilance-multiplier  l2norm-r))) ;;*vigilance-multiplier= 2.0
       ;;was also set  was-reset-p t)    
       ;;where is my equiv to Watson's   (setf (aref resetVal 0) res) 
       (t  (setf res 0.0 ;;I added
                 *skip-reset nil)))

      ;;Step 4:
      ;;after Watson's (setf (aref resetVal 0) res)
      ;;in any case, set resetVal 0 to res
      ;;not used in mine (setf  resetVal res) 

      ;;SSSX IF NOT RESET, make sure all non-reset  reset-vals = 0        
      #|         (loop
          for n from 1 to n-outputs
          do
          (unless (> (getsymval 'reset (list n)) 0)
            (setsymval 'reset (list n) 0))
          ;;end loop
          )|#
 
      ;;no longer used? not inside a cond
      #|(setf reset-x-coord  (* *overall-cycle-n *reset-x-gap)
                 *reset-vals (append *reset-vals (list (list *overall-cycle-n (list reset-x-coord  res)))))|#
         
      ;;(afout 'out cycle-reset-info1)   

      ;;DOES THIS BROADCAST THE RESET CHANGES?
      ;;(plotActivations "reset flag" 190 220 reset-val 0.0 1.0)

      ;;STEP 5: TEST FOR RESET with (> res (- 1.9  vigilance))
      (cond
       ;;Test RES > vigilance, 
       ((> res (- 1.9  vigilance))  

        ;;STEP 6: UPDATE RESETNIN and RESETNOUT VARS IF RESET
        ;;in case F3y-max-Index not found above?
        ;;done above (setq F3y-max-Index (findLargestOutput))
        ;;was-reset-p is reset to nil on each testReset,, triggers graph display if setting right
        (setf *my-reset-broadcast t 
              was-reset-p T)
        (multiple-value-setq ( F2y-max-Index F2y-max-value)
            (find-largest-node 'yi-2-2 *n-inputs))

        ;;Step 6.1: Set max-index reset to res (Grossberg way)  ;;was 1
        ;;(setsymval 'reset (list F3y-max-Index) res)  ;;was 1)
        ;;not used??(setsymval 'reset-cntr (list max-Index) 80)

        ;;SET THE RESET VALUES FOR F2 AND F3
        (setsymval  'resetnin (list F2y-max-Index 2 2) res)
        (setsymval  'resetnout (list F3y-max-Index 2 2) res)
        ;;set the data text -vals
        (setf  resetnini-2-2-vals (nth-value 1 (get-art-bottomsym-values 'resetnini-2-2))
               resetnouti-2-2-vals (nth-value 1 (get-art-bottomsym-values 'resetnouti-2-2)))

        ;;STEP 6.2 RECALC XI-1-3 AND YI-1-3 IF RESET? --------------
        (when recalc-F3L1xy-postreset-p
          (setsymval 'x (list F3y-max-index 1 3) *def-reset-xy-val)
          ;;find new y's
          (setq L2norm-xI-1-3 (L2NORM  'xI-1-3 *n-outputs) 
                L2norm-xI-1-3-e (+ L2norm-xI-1-3  e))

          (setf  *art-data-text (append *art-data-text (list (format nil "~%STEP 5: FIND YI-1-3~% FIND ~% Step 2.1: Find  L2norm-xI-1-3-e=  ~A after w loop:~%; L2norm-xI-1-3= ~A~% " L2norm-xI-1-3-e  L2norm-xI-1-3))))

          ;;Step 2.2: Find the normalized f3 inputs yi-1-3
          (loop
           for j from 1 to *n-outputs
           do    
           (setf xI-1-3  (getsymval 'x (list  j 1 3))
                 yI-1-3   (/ xI-1-3  L2norm-xI-1-3-e )
                 ;;was (my-floor-ceiling (/ xI-1-3  L2norm-xI-1-3-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling)
                 ;; redundant xi-1-3-vals (append xi-1-3-vals (list xi-1-3))
                 yi-1-3-vals (append yi-1-3-vals (list yi-1-3)))     
           ;;Set new yI-1-3 value
           (setsymval 'y (list  j 1 3) yI-1-3) 
           ;;end loop, when
           ))
        ;;end if recalc xi-1-3 and yi-1-3 ------------------------------------\

        ;;end when *tdelta-cycle-n > 1


        ;;IF TOTAL RESET OF  F1 and F2 X/Ys
        ;;For F1F2, Layer 1:
        (when (or *reset-all-F1F2L1-p  *reset-all-F1F2-p)
          (set-art-bottomsym-values 'xi-1-1  *art-initial-x)
          (set-art-bottomsym-values 'yi-1-1 *art-initial-y)
          (set-art-bottomsym-values 'xi-1-2  *art-initial-x)
          (set-art-bottomsym-values 'yi-1-2  *art-initial-y)
          (setf *art-data-text (append *art-data-text (list (format nil "==>>RESET: All F1,F2 LAYER 1 X and Y nodes RESET")))))
        ;;For F1F2, Layer 2:
        (when (or *reset-all-F1F2L2-p  *reset-all-F1F2-p)
          (set-art-bottomsym-values 'xi-2-1  *art-initial-x)
          (set-art-bottomsym-values 'yi-2-1  *art-initial-y)
          (set-art-bottomsym-values 'xi-2-2  *art-initial-x)
          (set-art-bottomsym-values 'yi-2-2  *art-initial-y)
          (setf *art-data-text (append *art-data-text (list (format nil "==>>RESET: All F1,F2 LAYER 2 X and Y nodes RESET")))))

        ;;FOR RESETTING F3 MAX VALUES
        ;;Layer 1
     (when (or *reset-all-F3Layer-maxs-p  *reset-XI-1-3-p) 
       (setf max-XI-1-3 (find-largest-node 'XI-1-3))
       (setsymval 'x (list max-XI-1-3 1 3) *def-reset-xy-val)
       (setsymval 'y (list max-XI-1-3 1 3) *def-reset-xy-val))
        ;;Layer 2
     (when (or *reset-all-F3Layer-maxs-p  *reset-XI-2-3-p) 
       (setf max-XI-2-3 (find-largest-node 'XI-2-3))
       (setsymval 'x (list max-XI-2-3 2 3) *def-reset-xy-val)
       (setsymval 'y (list max-xI-2-3 2 3) *def-reset-xy-val))
        ;;Layer 3
     (when (or *reset-all-F3Layer-maxs-p  *reset-XI-3-3-p) 
       (setf max-XI-3-3 (find-largest-node 'XI-3-3))
       (setsymval 'x (list max-XI-3-3 3 3) *def-reset-xy-val)
       (setsymval 'y (list max-xI-3-3 3 3) *def-reset-xy-val))
     ;;F3 monitoring
     (setf *art-data-text (append *art-data-text (list (format nil "==>>RESET: MAX F3 X and Ys in  LAYER 2 X and Y nodes. *reset-all-F3Layer-maxs-p= ~A" *reset-all-F3Layer-maxs-p))))

        ;;end was reset  (> res ...
        )
       ;;If not reset, set was-reset-p nil ??? reset reset vars to 0 too or elsewhere??
       (t  (setf was-reset-p nil 
                 *my-reset-broadcast nil)))

      ;;end when, l2norm-yi-1-1-e > clause    
      ))
   (T
    (setf was-reset-p nil 
          *art-data-text (append *art-data-text (list (format nil " IN TEST-RESET, *pattern-cycle-n= ~A *tdelta-cycle-n= ~A; *pattern-cycle-n MUST BE > 1 TO TEST FOR RESET~%" *pattern-cycle-n  *tdelta-cycle-n))))

    ;;end overall cond
    ))
      ;;MONITORING TEXT
      (setf cycle-reset-info1 (format nil "~%=>>FROM TEST-RESET;  *pattern-cycle-n = ~A; *tdelta-cycle-n= ~A~% Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= ~A  *min-input-criteria= ~A~%ALSO Cycle > 1;~%Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= ~A (at F3y-max-index= ~A)  *reset-y-criteria= ~A;   l2norm-yi-1-1-e= ~A;  initial was-reset-p= ~A; %; [IF Step 3 = NIL, res= 0]~%Step 5:  res=(* *vigilance-multiplier  l2norm-r)= ~A, *VIGILANCE-MULTIPLIER= ~A,  l2norm-r= ~A;  *skip-reset= ~A  ~% ** RESET TEST: (> res (- 1.9 vigilance))= ~A, res= ~A  (- 1.9 vigilance)= ~A, vigilance= ~A;" *pattern-cycle-n *tdelta-cycle-n l2norm-yi-1-1-e *min-input-criteria  F3y-max-value F3y-max-index *reset-y-criteria  l2norm-yi-1-1-e was-reset-p      res  *vigilance-multiplier  l2norm-r  *skip-reset (> res (- 1.9 vigilance))  res  (- 1.9 vigilance)  vigilance))     
      (setf cycle-reset-info2 (format nil "RESET VALUES: resetnini-2-2-vals= ~A>>> resetnouti-2-2-vals= ~A~%  *my-reset-broadcast= ~A    max-Index ~A~%  *skip-reset= ~A  updated was-reset-p= ~A ~%=== END TESTRESET ====" resetnini-2-2-vals resetnouti-2-2-vals  *my-reset-broadcast  F3y-max-index   *skip-reset was-reset-p))
      (setf cycle-reset-info3 (format nil "AFTER RESET X: xi-1-3-vals= ~A~%                  and xi-2-3-vals= ~A~%                and xi-3-3-vals= ~A; max-xi-1-3= ~A max-xi-2-3= ~A max-xi-3-3= ~A~%" (nth-value 1 (get-art-bottomsym-values 'xi-1-3)) (nth-value 1 (get-art-bottomsym-values 'xi-2-3))(nth-value 1 (get-art-bottomsym-values 'xi-3-3)) max-xi-1-3 max-xi-2-3 max-xi-3-3))
      (setf cycle-reset-info4 (format nil "AFTER RESET Y:  yi-1-3-vals= ~A~%                  and yi-2-3-vals= ~A~%                and yi-3-3-vals= ~A~%" (nth-value 1 (get-art-bottomsym-values 'yi-1-3)) (nth-value 1 (get-art-bottomsym-values 'yi-2-3))(nth-value 1 (get-art-bottomsym-values 'yi-3-3))))
      (setf  *art-data-text (append *art-data-text (list cycle-reset-info1 cycle-reset-info2 cycle-reset-info3 cycle-reset-info4)))

  (setq *skip-reset nil)

  ;;(setf  cycle-reset-info (format nil "~A~%~A" cycle-reset-info1 cycle-reset-info2))  

  ;;end *let, test-reset
  ))
;;TEST
;; (test-reset)
 

;;ddd
;;ORIGINAL ART3 TEST-RESET  DIDN'T USE R PROPERLY??
#|(defun test-reset ()  ;;&key (F1y-sym 'yi-2-1) (yhi-sym 'yi-2-2) (yF3 'yi-2-3))
  "In ART3.lisp, Used in One INPUT NOT one cycle--causes flip-flop if one cycle.  Checks for an F2 reset condition.  Compares F1, layer 2 yi2-1  TO  F3, layer 2 yi2-2 for reset.  If reset, sends signal to F2 Layer 2 xi-2-2; to ADAPTIVE WEIGHTS?; and to F3 Layer 2 xI-2-3, following ART3 MODEL. **ME- Try comparing F1 vs F2 patterns, but set reset to max F3-2 node. **"

  (let*
      ;;changed some var-names to make easier to write general function later
       ;;more general syms to use for any comparison
       ((res 0.0)
       (norm1 0.0001) ;;avoid 0?
       (norm2 0.0001) ;;avoid 0?
       (l2norm-yi-2-2 (L2NORM 'yi-2-2 *n-inputs))
       ;;p = signal from inputs
       ;;was (l2norm-p (L2NORM 'p *n-inputs))  ;;eg p=(P0 P1 P2 P3 P4)
       (l2norm-yi-2-2-e (+  l2norm-yi-2-2  e)) ;;was  (n1 (+  l2norm-yi-2-2  e)) ;;e= .04?
       ;;was (n1 (+  l2norm-p  e))
       (n2)
       (temp)
       (l2norm-r)
       ;;this is reset on each test-reset
       (was-reset-p)
       (reset-x-coord) 
       (y-max-value)
       (y-max-IndexF1)
       ;;for outputs
       (y-max-indexF2)
       (y-max-indexF3)
       (reset) ;;general value given to all reset outputs
       ;;(reset-ninput)
       ;;(reset-noutput)
       ;;other
       (cycle-reset-info)
       (cycle-reset-info1)       
       (cycle-reset-info2)
       ;;(cycle-reset-info3)
       )
;;(if (=  *print-details 0)(afout 'reset-info (format nil ">>>>NEW-CYCLE: In TEST-RESET 1, *art-learn-cycle-n= ~A~%   l2norm-yi-2-2-e=(+  l2norm-p e)=  ~A, l2norm-yi-2-2= ~A e= ~A  *skip-reset= ~A" *art-learn-cycle-n l2norm-yi-2-2-e  l2norm-yi-2-2  e  *skip-reset)))
      ;; (afout 'out (format nil "~%>>>> CYCLE INITIAL RESET-INFO: ~A"cycle-reset-info1) )
     ;;PRE-TEST FOR ADEQUATE INPUT, ETC
     (cond
      ;;Step 1:  tests for adequate INPUT to test for reset and not *skip-reset
      ((and (> l2norm-yi-2-2-e *min-input-criteria) ;;was  0.2)
            (not *skip-reset))
       ;;Step 1a. When NOT on first cycle
       (when
           (>  *art-learn-cycle-n 1)
         ;;Step 2: find  WDN SIGNAL l2norm-r
         ;; SSS CHECK was  'r  is resetnini-2-2 the right replacement???
         
         ;;was (setf  l2norm-r  (L2NORM  'resetnini-2-2  *n-inputs))
         ;;was , (setf  l2norm-r  (L2NORM  'r  *n-inputs)) 

         ;;FIND THE LARGEST Y OUTPUT VALUE
         ;;  F3, SO CAN MAKE THAT THE RESET NODE
         (multiple-value-setq (y-max-IndexF3 y-max-value)
             (find-largest-node  'yi-2-3 ))    


         ;;Step 3. Test ON-CENTER y-output must exceed  *reset-y-criteria = .25?
         (cond
          ;;SSS  USE F3 OR F2?? 
          ((> y-max-IndexF3 *reset-y-criteria)  ;;0.2, orig= 0.25
           ;;set RES based upon wdn signal norm
           (setf res  (*  *vigilance-multiplier  l2norm-yi-2-2)))  ;;was also set  was-reset-p t)    
          ;;where is my equiv to Watson's   (setf (aref resetVal 0) res) 
          (t  (setf res 0.0 ;;I added
                    *skip-reset nil)))
         ;;end when *art-learn-cycle-n > 1, l2norm-yi-2-2-e> 0.2
         
         ;;Step 4:         
         ;;(afout 'out cycle-reset-info1)   
         ;;DOES THIS BROADCAST THE RESET CHANGES?

         ;;TEST FOR RESET
         (cond
          ;;Step 5. Test RES > *vigilance, 
          ((> res (- 1.9  *vigilance))  ;; me

           ;;Step 6: Update reset vars if reset
           ;;in case y-max-Index not found above?

           (setf y-max-IndexF1 (find-largest-node 'yi-2-1 )
                 y-max-IndexF2 (find-largest-node 'yi-2-2 ))
 
           ;;Step 6.1: Set max-index reset to res (Grossberg way)  ;;was 1
           ;;For both F2 and F2 and for adaptive weights (which ones??)
           ;;Adaptive weights must look up these indexes (wup = n-inputs wdn = n-outputs)

           ;;SET THE RESETNIN AND RESETNOUT VALUES
           (setsymval 'resetnin (list y-max-IndexF2 2 2) res) ;;or could be 1.0
           (setsymval 'resetnout (list y-max-IndexF3 2 2) res)   ;;or could be 1.0        

            (setf *my-reset-broadcast t 
                 was-reset-p T)     
            ;;end > res clause, when, (and (> l2norm-yi-2-2-e ... clause
            ))))

    ;;If not reset, set was-reset-p nil; reset reset vars to 0 too when begin new cycle.
     (t (setf was-reset-p nil )))

     (setf resetnini-2-2-vals (nth-value 1 (get-art-bottomsym-values 'resetnini-2-2))
            resetnouti-2-2-vals (nth-value 1 (get-art-bottomsym-values 'resetnouti-2-2)))

   ;;MONITORING TEXT
   (setf cycle-reset-info1 (format nil "~%===>>FROM TEST-RESET;  NEW-CYCLE:*art-learn-cycle-n = ~A;~% Step 1: IF (> l2norm-yi-2-2-e *min-input-criteria), l2norm-yi-2-2-e= ~A  *min-input-criteria= ~A~%ALSO Cycle > 1;~%Step 3: IF (> y-max-value *reset-y-criteria),   y-max-value= ~A (at y-max-index= ~A)  *reset-y-criteria= ~A;   l2norm-yi-2-2-e= ~A;  initial was-reset-p= ~A;  r  l2norm-yi-2-2= ~A~%; [IF Step 3 = NIL, res= 0]~%Step 5:  res=(* *vigilance-multiplier  l2norm-yi-2-2)= ~A, *vigilance-multiplier= ~A, ;  *skip-reset= ~A  ~% ** RESET TEST: (> res (- 1.9 *vigilance))= ~A, res= ~A  (- 1.9 *vigilance)= ~A, *vigilance= ~A;"*art-learn-cycle-n l2norm-yi-2-2-e *min-input-criteria  y-max-value y-max-index *reset-y-criteria  l2norm-yi-2-2-e was-reset-p      res *vigilance-multiplier  l2norm-r  *skip-reset (> res (- 1.9 *vigilance))  res  (- 1.9 *vigilance) *vigilance))

    (setf cycle-reset-info2 (format nil "UPDATE?  *my-reset-broadcast= ~A    max-Index ~A~%  *skip-reset= ~A  updated was-reset-p= ~A; === end OLD INFO TESTRESET ====~%
ALL-RESET VALS==>   resetnini-2-2-vals= ~A resetnouti-2-2-vals= ~A~%"  *my-reset-broadcast  y-max-index   *skip-reset was-reset-p  resetnini-2-2-vals  resetnouti-2-2-vals))

     (setf  *art-data-text (append *art-data-text (list (format nil "~A~%~A"  cycle-reset-info1 cycle-reset-info2))))
    (setq *skip-reset nil);; temporary
  
    ;;end *let, testReset
    ))|#



;;UPDATE-WEIGHTS
;;
;;ddd
(defun update-weights (outvar-sym &key wup-sym wdn-sym (reset-sym 'resetnouti-2-2))  
;;;SSS ART2 uses y-output to determine max-nonreset-outvar-index; but in ART3 entire F3 is really replacement for ART2 F2, y-output; SO WHICH "OUTPUT" DO I USE?  X OR Y FROM WHICH OF 3 LAYERS??  
;; I will START WITH  YI-1-3

  "In ART3.lisp, Updates weights for LTM model. wup and wdn are the topsyms"
  (let*
      ((max-nonreset-outvar-index (find-largest-nonreset-node  outvar-sym))                   
       (g)
       (outvar-root)
       (max-outvar-val)
       ;;(wdnval)
       (wdn)
       (wdn-vals)
       (wdn-dims)
       (wdn-root)
      ;; (wupval)
       (wup)
       (wup-vals)
       (wup-dims)
       (wup-root)
       (new-dims)
       ( restdims-dn1)( restdims-dn2)
       ( new-dims-dn1)( new-dims-dn2)
       ( restdims-up1)( restdims-up2)
       ( new-dims-up1)( new-dims-up2)
       (n-dims)( root)
       (wdn-curdims)
       (wup-curdims)
       (outdims)(outrestdims2)(out-n-dims)
       (curoutdims) 
       (restoutdims)
       ;;(outdims)
       )
    ;;
    ;;(if (> *print-details 0)  (afout 'out (format nil "--- IN update-weights; Largest output max-nonreset-outvar-index= ~A " )))
     (setf  *art-data-text (append *art-data-text (list (format nil "~%==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= ~A " max-nonreset-outvar-index))))

      (setf  g  (g  max-nonreset-outvar-index  outvar-sym))  ;;was *n-outputs))

      (when  (>  g  *min-g)  ;;was 0.02)
        ;;when g > *min-g update weights for that j

        ;;FIND THE MAX-OUTVAR-VAL (USED TO MULTIPLY BY ALL WDN'S)
        (multiple-value-setq (outdims restoutdims 
                                      outrestdims2 out-n-dims outvar-root) ;; new-dims1 new-dims2 )
            (find-last-art-dims outvar-sym max-nonreset-outvar-index))
        (setf max-outvar-val (getsymval outvar-root outdims))  ;;was p

        ;;IF UPDATE WDN and/or UPDATE WUP, find DIMS
        (when wdn-sym
          (multiple-value-setq (new-dims restdims-dn1 restdims-dn2
                                         n-dims root new-dims-dn1 new-dims-dn2)
              (find-last-art-dims wdn-sym  'i  'i))
          ;;end when wdn-sym
          )
        (when wup-sym
          (multiple-value-setq (new-dims restdims-up1 restdims-up2
                                         n-dims root new-dims-up1 new-dims-up2 )
              (find-last-art-dims wup-sym  'i  'i))
          ;;end when wup-sym
          )

        ;;FOR EACH F1 WEIGHT related to the F2 MAX-NONRESET-OUTVAR-INDEX
        (loop
         for i from 1 to  *n-inputs
         ;;this is correct, the j comes = max-nonreset-outvar-index
         ;; i is FIELD 2 for wdn and in FIELD 1 for wup
         do

         ;;WHEN WDN-SYM
         (when wdn-sym
           (setf  wdn-curdims (append (list max-nonreset-outvar-index)  restdims-dn1 (list 'to)
                                  (list i) restdims-dn2))

           ;;NOTE: only the MAX outvar-sym is used 
           ;;not needed curoutdims (append (list i) restoutdims))

           (setf wdn  (getsymval 'wdn wdn-curdims)
                 ;;downLR= 0.8? was 0.12  d= 0.4 ?
                 ;;was wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001)
                 ;;test, prevent wdn from decreasing much
                 wdn  (+ wdn (* downLR   d  (- max-outvar-val   wdn)))
                 ;;was wdn  (+ wdn (* downLR   d  (my-floor (- max-outvar-val   wdn) :floor  -0.2)))
                 wdn-vals (append wdn-vals (list wdn)))
           ;;value was (eval outvar-sym)
           (setsymval 'wdn wdn-curdims wdn)    
           ;;(if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wDN FOR max-nonreset-outvar-index=~a  i=~a; wdn (my-floor (+ wdn (* downLR   d  (-  max-outvar-val  wdn))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" max-nonreset-outvar-index i wdn wdn downLR d max-outvar-val)))
           ;;was (if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wDN FOR j=~a i=~a; wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" j i wdn wdn downLR d p)))
           ;;end  when wdn-sym
           )
     
         ;;IF WUP-SYM
         (when wup-sym
           (setf  wup-curdims 
                  (append (list i)  restdims-up1 (list 'to) 
                          (list max-nonreset-outvar-index) restdims-up2))

           (setf ;;max-outvar-val (getsymval outvar-root curoutdims)  ;;was p
                 wup  (getsymval 'wup wup-curdims)
                 ;;downLR= 0.8? was 0.12  d= 0.4 ?
                 ;;was wup (my-floor (+ wup (* downLR   d  (-  p  wup))) :floor .0001)
                 ;;test, prevent wup from decreasing much
                 wup  (+ wup (* downLR   d  (- max-outvar-val   wup)))
                 ;;was wup  (+ wup (* downLR   d  (my-floor (- max-outvar-val   wup) :floor  -0.2)))
                 wup-vals (append wup-vals (list wup)))
           ;;value was (eval outvar-sym)
           (setsymval 'wup wup-curdims wup)    
           ;;(if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wup FOR max-nonreset-outvar-index=~a  i=~a; wup (my-floor (+ wup (* downLR   d  (-  max-outvar-val  wup))) :floor .0001))=wup= ~A~%wup= ~A downLR= ~A  d= ~A  p= ~A" max-nonreset-outvar-index i wup wup downLR d max-outvar-val)))
           ;;was (if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wup FOR j=~a i=~a; wup (my-floor (+ wup (* downLR   d  (-  p  wup))) :floor .0001))=wup= ~A~%wup= ~A downLR= ~A  d= ~A  p= ~A" j i wup wup downLR d p)))
           ;;end  when wup-sym
           )
         ;;end loop *n-inputs, G  > *min-g
         ))
      (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 1: FIND wDN FOR max-nonreset-outvar-index=~a  wdn-vals= ~A~% wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= ~A  d= ~A  max-outvar-val= ~A" max-nonreset-outvar-index  wdn-vals  downLR  d  max-outvar-val))))
      (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 1: FIND Wup FOR max-nonreset-outvar-index=~a  wup-vals= ~A~% wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= ~A  d= ~A  max-outvar-val= ~A" max-nonreset-outvar-index  wup-vals  downLR  d  max-outvar-val))))
      (setf  *art-data-text (append *art-data-text (list (format nil "~%==>> END UPDATE WEIGHTS ==========~%"))))
     nil
    ;; let, update-weights
    ))
;;TEST
;; (progn (setf *print-details 3)(setsymval 'y3-3-2 nil 0.88))
;; (update-weights  'YI-1-3  :WDN-SYM  'WDNI-1-3TOI-3-2 :WUP-SYM  'WupI-3-2TOI-1-3)


;;============== OLDER VERSIONS -- DELETE AFTER DEBUG ============
#|(defun update-weights (wdn-sym wup-sym output-sym)      ;;was (var-sym &key wup wdn) 
    "In ART3.lisp, Updates weights for LTM model. If don't want a weight calc, set to NIL."
  (let
      (;;not needed (j  (find-largest-output output-sym))
       (g)
       (wdn)
       (wdn)
       (wdn-insts)
       ;;(wdn-dims)
       (wup)
       (wup-insts)
       ;;(wup-dims)
       (wup)
       )
    ;;
    ;;(if (> *print-details 0)  (afout 'out (format nil "--- IN update-weights; Largest output j= ~A " j)))

    ;;UPDATE WDNS?
    (when wdn-sym
      (setf wdn-insts (find-bottom-art-instances wdn-sym))

     ;;was (setf  g (g output-sym))                 ;;was (g nil output-sym))  
      (when  (>  g  *min-g)  ;;was 0.02)      
        (loop
         for inst in wdn-insts
         for j from 1 to (list-length wdn-insts)
         do
         (setf  g (g output-sym))  
         (setf wdn (getsymval inst)
               wdn (+ wdn (* downLR   d  (my-floor (-  g  wdn) :floor  -0.2))))
         ;;WAS (eval var-sym) INSTEAD OF G
         (setsymval wdn-sym wdn)

         
#|         (loop
          for i from 1 to *n-inputs
          do
          ;;(set var-sym (getsymval var-sym  (list  i 1 3 'TO j 3 2) ))  ;;was p
          (setf wdn  (getsymval 'wdn (list  j 1 3 'to i 3 2))
                ;;downLR= 0.8? was 0.12  d= 0.4 ?
                ;;was wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001)
                ;;test, prevent wdn from decreasing much
                wdn  (+ wdn (* downLR   d  (my-floor (-  (eval var-sym)  wdn) :floor  -0.2))))
          (setsymval 'wdn (list  j 1 3 'to i 3 2) wdn)   
          |#

          (if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wDN FOR j=~a  i=~a; wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" j  i  wdn wdn downLR d p)))
          ;;was (if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wDN FOR j=~a i=~a; wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" j i wdn wdn downLR d p)))
          ;;end  loop
          )
         ;;end  when g, when wdn
         ))

      ;;Update wups?
    (when wup-sym
      (setf wup-insts (find-bottom-art-instances wup-sym))

      (setf  g (g output-sym))            ;;was (g nil output-sym))  
      (when  (>  g  *min-g)  ;;was 0.02)      
        (loop
         for inst in wup-insts
         for n from 1 to (list-length wup-insts)
         do
         (setf wdn (getsymval inst)
               wdn (+ wdn (* downLR   d  (my-floor (-  G  wdn) :floor  -0.2))))
         ;;WAS (eval var-sym) INSTEAD OF G
         (setsymval wup-sym wup)

    #|(when wup-sym
      (setf  g (g  j var-sym *n-outputs))
      (when  (>  g  *min-g)  ;;was 0.02)
        (loop
         for i from 1 to *n-inputs
         do
        (setf wup0  (getsymval 'wUp (list i 3 2 'to j 1 3)))
        (set var-sym (getsymval var-sym (list i)))  ;was p
        ;;was wup (my-floor  (+  wup0  (*  upLR    d  (- p  wup0)))  :floor 0.00001 ))
        (setf wup 
              (+ wup0 (* upLR   d  (my-floor (-  (eval var-sym)  wup0) :floor  -0.2))))  
        ;;upLR= 0.8? d=0.4?    
        (setsymval 'wUp (list i 3 2 'to j 1 3) wup)
        |#

        (if (= *print-details 3)(afout 'out (format nil  "~%Step 2: FIND wUP FOR i= ~A  j=~a; wup (my-floor (+ wup0 (* upLR   d  (-  p  wup0))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" i j wup wup0 upLR d p)))
        ;;was (if (= *print-details 3)(afout 'out (format nil  "~%Step 2: FIND wUP FOR i= ~A  j=~a; wup (my-floor (+ wup0 (* upLR   d  (-  p  wup0))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" i j wup wup0 upLR d p)))
        ;;end  loop
        )
      ;;end whens
      ))
      
      ;;end let, update-weights
    ))|#



#| OLDER
(defun update-weights (wdn-sym wup-sym output-sym)      ;;was (var-sym &key wup wdn) 
    "In ART3.lisp, Updates weights for LTM model. If don't want a weight calc, set to NIL."
  (let
      (;;not needed (j  (find-largest-output output-sym))
       (g)
       (wdn)
       (wdn)
       (wdn-dims)
       (wup)
       (wup-dims)
       (wup0)
       )
    ;;
    ;;(if (> *print-details 0)  (afout 'out (format nil "--- IN update-weights; Largest output j= ~A " j)))

    ;;UPDATE WDNS?
    (when wdn-sym
      (multiple-value-bind (dims root)
          (find-art-dims wdn-sym)
        (setf wdn-dims (list (append (list i))))
      (setf  g (g output-sym))  
      (when  (>  g  *min-g)  ;;was 0.02)
        (loop
         for i from 1 to *n-inputs
         do
         (set var-sym (getsymval var-sym  (list  i 1 3 'TO j 3 2) ))  ;;was p
         (setf wdn  (getsymval 'wdn (list  j 1 3 'to i 3 2))
              ;;downLR= 0.8? was 0.12  d= 0.4 ?
              ;;was wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001)
              ;;test, prevent wdn from decreasing much
              wdn  (+ wdn (* downLR   d  (my-floor (-  (eval var-sym)  wdn) :floor  -0.2))))
         (setsymval 'wdn (list  j 1 3 'to i 3 2) wdn)    

         (if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wDN FOR j=~a  i=~a; wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" j  i  wdn wdn downLR d p)))
         ;;was (if (= *print-details 3)  (afout 'out (format nil  "~%Step 1: FIND wDN FOR j=~a i=~a; wdn (my-floor (+ wdn (* downLR   d  (-  p  wdn))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" j i wdn wdn downLR d p)))
         ;;end  loop
         )
        ;;end  when g, when wdn
        ))

      ;;Update wups?
    (when wup-sym
      (setf  g (g  j var-sym *n-outputs))
      (when  (>  g  *min-g)  ;;was 0.02)
        (loop
         for i from 1 to *n-inputs
         do
        (setf wup0  (getsymval 'wUp (list i 3 2 'to j 1 3)))
        (set var-sym (getsymval var-sym (list i)))  ;was p
        ;;was wup (my-floor  (+  wup0  (*  upLR    d  (- p  wup0)))  :floor 0.00001 ))
        (setf wup 
              (+ wup0 (* upLR   d  (my-floor (-  (eval var-sym)  wup0) :floor  -0.2))))  
        ;;upLR= 0.8? d=0.4?    
        (setsymval 'wUp (list i 3 2 'to j 1 3) wup)

        (if (= *print-details 3)(afout 'out (format nil  "~%Step 2: FIND wUP FOR i= ~A  j=~a; wup (my-floor (+ wup0 (* upLR   d  (-  p  wup0))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" i j wup wup0 upLR d p)))
        ;;was (if (= *print-details 3)(afout 'out (format nil  "~%Step 2: FIND wUP FOR i= ~A  j=~a; wup (my-floor (+ wup0 (* upLR   d  (-  p  wup0))) :floor .0001))=wdn= ~A~%wdn= ~A downLR= ~A  d= ~A  p= ~A" i j wup wup0 upLR d p)))
        ;;end  loop
        )
      ;;end whens
      ))
      
      ;;end let, update-weights
    ))
|#
;;============== END OLDER VERSIONS -- DELETE AFTER DEBUG ========




#|(defun find-output-dims-from-weight (weight-sym &key dn-p up-p)
  "In U-ART, given a weight eg. wdni-1-3toi-3-2, finds the proper dims for related Y output nodes, eg. Yi-3-2"
  (let
      ((output-dims)
       (output-sym-str)
       (output-sym)
       )
    ;;FINISH IF NEEDED
))|#



;;xxx -------------------------------------- SUB-CALCULATION FUNCTIONS --------------------------
;;NOTE:  SEE ART2 ART2.lisp FOR ARRAY VERSIONS OF THESE FUNCTIONS

;;FRANDOM
; Floating point  random numbers:
;;ddd
(defun frandom (low high)
  (let ((range (- high low)))
    (+ (* (/ (random 1000) 1000.0) range) low)))


;;FIND-LARGEST-NODE
;;ddd
(defun find-largest-node  (var-sym &optional n-outputs) 
  "In ART3, returns (values  maxIndex maxVal) n-outputs not needed, outdated."
  (find-largest-ART-ValueIndex var-sym  :avoid-reset-indexes-p nil)
  )
;;TEST
;; (find-largest-node 'yi-1-3) = 3 22.22 Y3-1-3 (3 1 3)


;;FIND-LARGEST-NONRESET-NODE
;;ddd
(defun find-largest-nonreset-node (var-sym &key (reset-root 'resetnout)
                                           (reset-dims '(i 2 2)))
 ;;was (reset-dims '(i 2 2))) ;; (&optional node n-outputs)
  "In ART3, returns (values  maxIndex maxVal) *n-outputs not needed, outdated."
  (find-largest-ART-ValueIndex var-sym  :avoid-reset-indexes-p T
                               :reset-root  reset-root :reset-dims reset-dims)
  )
;;TEST
;; (find-largest-nonreset-node  'yi-1-3) =  5 11.11 Y5-1-3 (5 1 3)
;; (find-largest-nonreset-node  'yi-2-2 :reset-root 'RESETNIN)



;;G
;;
;;ddd
;;SSS START HERE -- VERY MESSY -- USE ART2 FOR  G IF POSSIBLE
;;ACTUALLY MAY REPLACE SIGMOID INSTEAD OF G (since no sigmoid in ART3)
;;
#|(defun g-choice (index node &key (p *pc7-3) (p (reset-root 'resetnout) (reset-dims '(i 2 2))) ;;was &optional node n-outputs) ;;was  &aux j mVal)   ;; (maxIndex (find-largest-output)))
  "In ART3, If index = MAX y-output index AND that y NOT reset AND the y-output for that index > p [*p, then RETURNS constant d, otherwise returns 0.00001"
  (multiple-value-bind (maxIndex maxVal)
      (find-largest-nonreset-node node :reset-root reset-root :reset-dims reset-dims) ;; largest NOT been reset
  (cond
   ((and
       (equal index maxIndex)
       (> maxVal  p)) ;;was resetThreshold
    (- maxVal  (/ p                                       ;;grossberg formula = (w  -  p7 / p8) Sq 
    )              ;;was d=  0.4 in ART2
   (t  0.0001))  ;;grossberg= 0, prevent divide by 0??
  ;;end let, g
  ))|#


(defun g (index node &key (reset-root 'resetnout) 
                (onCenterThreshold *onCenterThreshold) 
                (def-g-val *def-g-val) (reset-dims '(i 2 2))
                (on-center-output d) (off-center-output *def-g-val))
;;was &optional node n-outputs) ;;was  &aux j mVal)   ;; (maxIndex (find-largest-output)))
  "In ART3, If index = MAX y-output index AND that y NOT reset AND the y-output for that index > *onCenterThreshold, then RETURNS constant d, otherwise returns 0.00001"
  (multiple-value-bind (maxIndex maxVal)
      (find-largest-nonreset-node node :reset-root reset-root :reset-dims reset-dims) ;; largest NOT been reset
  (cond
   ((and
       (equal index maxIndex)
       (> maxVal  onCenterThreshold)) ;;was resetThreshold
    on-center-output)       ;;d=  0.4?
   (t  off-center-output))  ;;prevent divide by 0??
  ;;end let, g
  ))



;;SIGMOID
; Threshold function:
;;ddd  From Grossberg ART3:
      ;; CHOICE;   g (w)  =  {0    ;if w <=  p7}
      ;;                                 { (w  -  p7 / p8) Sq     ;if w  >   p7 }
(defun sigmoid (stm-activity  &key (stm-criterion  theta) (def-sigmoid-val *def-sigmoid-val))
  "In ART3.lisp, threshold function when p-criterion is a number (not a function).Theta is ART2 parameter."
  (cond
   ((> stm-activity stm-criterion)   ;;theta = .4?
    stm-activity)
   (t   def-sigmoid-val)) ;;was 0, avoid div by 0
  )
;;TEST
;; (sigmoid 0.77 :p 0.4) = 0.77
;; (sigmoid 0.22 :p 0.4) = 0


;;SIGMOID-F3-CHOICE
;; DON'T USE THIS UNLESS ART2 VERSION DOESN'T WORK FOR CHOICE??
;;ddd
(defun sigmoid-F3-choice (stm-activity n-nodes &key (def-sigmoid-val *def-sigmoid-val)) 
  "In ART3.lisp, threshold function when p-criterion is  a function to evaluate stm-activity: 1/ SqRt nc.  WHAT IS NC?? IS IT number of cells in the field 3= n-nodes?"
  (let
      ((p)
       )
  (setf  p  (/  1  (sqrt n-nodes)))
  (cond
   ((> stm-activity p)   ;;was theta 
    stm-activity)
   (t   def-sigmoid-val)) ;;was 0, avoid div by 0
  ))


#| ORIGINAL ART2 VERSION
(defun sigmoid (y-activity)  ;;was x-activity
  "In ART3.lisp, threshold function."
  (cond
   ((> y-activity theta)   ;;theta 0.3
    y-activity)
   (t  0.0001)) ;;was 0, avoid div by 0
  )|#



;;L2NORM
; L2 Norm of a vector/list of values:
;;ddd
(defun L2NORM (var  vLength &key dims) ;; &aux (sum 0.0) i j)
  "In ART3.lisp, Norm of a vector/list of values. Sqrt of sum of squares. Note: In seq of similar nums, l2norm about (* 0.5 simple-sum), but if one num dominate, close to that number. If dims, var must be root."
    (let*
        ((l2norm 0.0001) ;;was 0
         (sum 0.0001) ;;was 0
         (i)
         (root)
         (rest-dims)
         (vi-value)  ;;error was (getsymval v (list i)))
         )

      (cond
       (dims (setf root var))
       (t
        (multiple-value-setq (dims root)
            (find-art-dims var))))

      (setf rest-dims (cdr dims))

   (loop
    for i from 1 to vLength
    do
    (setf  vi-value (getsymval root (append  (list i ) rest-dims))
          sum (+ sum  (* vi-value vi-value)))
    ;;end let, loop
    )
  (setf l2norm (+ (sqrt sum) 0.0001)) ;;0.001prevents l2norm=0, for division later
  ;;end let, L2NORM
  ))
;;TEST
;; (L2NORM 'XI-1-1 5) = 0.0101
;; (getsymval 'XI-1-1)
;; (L2NORM 'XI-1-1 9) = 1.762

;; (setf test-xi '(0.1748 -0.55 0.27079996 1000.08045 -0.542 0.33959997 0.3428 1000.54285 1000.1428))
;;  (my-normalize '(.0001 .0001 .0001 0.5511597 .0001) )
;; (L2NORM 'xi-2-3 5) = 0.56325055
;; (L2NORM  'v-activity 9) = 17.822482
;;
;;Note: To get an idea of how values are affected
;;  (my-normalize '(1 1 1 1.0)) = 2.0 4.0 4.0  (0.5 0.5 0.5 0.5)  2.0
;;  (my-normalize '(.1 .1 .1 .1)) = 0.2  0.040000003  0.4  (0.5 0.5 0.5 0.5)  2.0
;;  (my-normalize '(1 2 3 4 5)) = 7.4161983 55.0  15.0  (0.13483998 0.26967996 0.40451992 0.5393599 0.6741999)  2.0225997
;;  (my-normalize '(11 12 13 14)) = 25.0998  630.0  50.0  (0.4382505 0.47809145 0.5179324 0.55777336)  1.9920478
;;  (my-normalize '(1 -2  3 -4 5)) = 7.4161983 55.0  3.0  (0.13483998 -0.26967996 0.40451992 -0.5393599 0.6741999)  0.4045199
;;  (my-normalize '(0.1 0.2 0.3 0.4 0.5)) = 0.7416199 0.55 1.5 (0.13483997 0.26967993 0.40451992 0.53935987 0.6741998)  2.0225995
;;  (my-normalize '(0.01 0.02 0.03 0.04 0.05)) = 0.074161984
;;  (my-normalize '(1 2 3 4 1000)) = 1000.015 1000030.0  1010.0  (9.99985E-4 0.00199997 0.0029999549 0.00399994 0.999985)  1.0099849
;;  (my-normalize '(1 1 1  .0001)) = 1.7320508  3.0  3.0001  (0.57735026 0.57735026 0.57735026 5.7735026E-5)  1.7321085


;; =============== DELETE? WAS IN F3-CYCLE ===========
   ;;I THINK THIS SHOULD ONLY BE DONE IN F2-CYCLE BECAUSE IT IS PART OF THE INPUT+CALC FOR XI-3-2
  ;; STEP 3: CALC THE WDNI-1-3TOI-3-2  F3-F2 FEEDBACK SIGNALS
    ;;Step 1: find total sum =  (+ sum (* g wdn)) for each input/output
    ;;NOTE: This loop includes inner *no-outputs and *n-inputs loops. 
    ;;calc sum-f3dn done in f2--not needed to do here? which is better?
    ;;  i = *n-inputs   j = *n-outputs;  wUP = i, j  wDN = j,i   

#|    (loop
     for i from 1 to *n-inputs
     do
     (setf sum-F3dn  0.0)                  ;;try 0.0   0.00001)

     ;;Step 1.1  Find sum-F3dn  of all F2 wdn signals
     (loop
      for j from 1 to *n-outputs
      do
      (setf  g (g  j 'YI-1-3)
             ;;was(g  j 'YI-2-3  *n-outputs)  ;;IS YI-2-3 RIGHT SSS
             wdn (getsymval 'wdn (list j 1 3 'to i 3 2))
             sum-F3dn  (+ sum-F3dn  (* g wdn))
             ;;was  (my-floor-ceiling (+ sum-F3dn  (* g wdn)) :floor *wt-floor :ceiling *wt-ceiling)
             g-vals (append g-vals (list g))
             sum-F3dn-vals (append sum-F3dn-vals (list sum-F3dn)))

      ;;(if (= *print-details 3) (afout 'out (format nil  "~%Step 1.1: FIND sum-F3dn,  Inside loop (j to *n-outputs), FOR j=~A i= ~s, *n-outputs= ~s ~%,  sum-F3dn= (+ sum-F3dn (* g wdn))= ~A; g= ~A wdn ~A" j i *n-outputs sum-F3dn g wdni-1-3toi-3-2)))
      ;;was (if (= *print-details 3) (afout 'out (format nil  "~%Step 1.1: FIND sum-F3dn,  Inside loop (j to *n-outputs), FOR j=~A i= ~s, *n-outputs= ~s ~%,  sum-F3dn= (+ sum-F3dn (* g wdwdni-1-3toi-3-2n))= ~A; g= ~A wdni-1-3toi-3-2= ~A" j i *n-outputs sum-F3dn g wdni-1-3toi-3-2)))
      ;;end inner, j loop
      )
     ;;end outer, i loop
     )
     (setf  *art-data-text (append *art-data-text (list (format nil  "~%Step 1.1: FIND F3-WDN: sum-F3dn-vals= ~A;~%,FOR each nj=~A ni= ~s, ,  sum-F3dn= (+ sum-F3dn (* g wdn));~% g-vals= ~A  wdn-vals= ~A"  sum-F3dn-vals *n-outputs *n-inputs g-vals  wdn-vals))))
|#


    ;; FOLLOWING IS DONE IN F1-CYCLE-- DON'T REPEAT HERE??
    ;;Step 2:  For each input, finds yI-3-1 based upon p and l2norm-xI-3-1
     ;;was For each input, finds q-activity based upon p and norm 
    ;; Update q-activity using eq. 5
 #|   (setf  L2norm-xI-3-1  (L2NORM 'xI-3-1 *n-inputs)
          L2norm-xI-3-1-e  (+ L2norm-xI-3-1  e))
    ;;was  (setf  L2norm-p  (L2NORM 'p *n-inputs);;was(my-floor (L2NORM 'p *n-inputs) :floor .0001)         L2norm-p-e  (+ L2norm-p  e))  ;;e= 0.04?

    (setf xi-3-1-vals nil
           yi-3-1-vals nil)

    (loop
     for i from 1 to *n-inputs
     do
     (setf xI-3-1 (getsymval 'x (list  i 3 1))
           yI-3-1  (/  xI-3-1  L2norm-xI-3-1-e)
           xi-3-1-vals (append xi-3-1-vals (list xi-3-1))
           yi-3-1-vals (append yi-3-1-vals (list yi-3-1)))
     ;;was (setf p (getsymval 'p (list  i))      q-activity (/  p  L2norm-p-e))

     (setsymval 'y (list  i  3 1) yI-3-1) 

     ;;(if (= *print-details 3) (afout 'out (format nil "~%Step 2: FIND yI-3-1, FOR J= ~A, yI-3-1= (/ xI-3-1  L2norm-xI-3-1-e)= ~A;  pi= ~A   L2norm-xI-3-1-e=(+ (L2NORM 'xI-3-1 *n-outputs) e)= ~A" i yI-3-1 xI-3-1 L2norm-xI-3-1-e)))
     ;;was (if (= *print-details 3) (afout 'out (format nil "~%Step 2: FIND q-activity, FOR J= ~A, q-activity= (/ pi  norm-p-e)= ~A;  pi= ~A   L2norm-p-e=(+ (L2NORM 'p *n-outputs) e)= ~A" i q-activity p L2norm-p)))
     ;;end *n-inputs loop
     )
          (setf  *art-data-text (append *art-data-text (list (format nil "~%Step 2: FIND yI-3-1-vals= ~A,~% FOR  yI-3-1= (/ xI-3-1  L2norm-xI-3-1-e);~%  xI-3-1-vals= ~A   L2norm-xI-3-1-e=(+ (L2NORM 'xI-3-1 *n-outputs) e)= ~A"  yI-3-1-vals xI-3-1-vals  L2norm-xI-3-1-e))))
  |#