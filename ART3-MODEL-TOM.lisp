;;******************************* ART3-MODEL-TOM.lisp **********************
;; 
;;My additions/changes to Grossberg ART3-MODEL.lisp
;;

;;========= ART3 CELL/NODE/SYMBOL FORMAT ====================
;;
;;  (eval ROOT) = (root-str dimlist syms value?) 
;;
;;  DIMLIST= list of i=celln, j=layern, f=fieldn, m=modulen OR integer OR :TO or other keyword. 
;;  For bottom level cell/path/var (which has the value), all dimlist elements are INTEGERS except keywords. For higher level cell/path/var, dimlist numbering starts at the FAR RIGHT. Each cell, layer, etc that is subordinate is indicated by i,j,f, etc instead of a number. (Egs. XI, XI-J-F-2, XI-J-2-1, XI-2-2-1, X3-2-2-1 indicate different levels, each having a sublist of syms).
;;  SYM= SYM PARTS= root, dimlist with separators ("-").
;;  Above scheme can be NESTED at to any level and EXTENDED to types of modules, brain regions, etc.
;;
;; RULES: ---------------------------------------------------------------------------------------
;; 1. All parts of ART model must be broken down to either a NODE or a PATH.
;; 2. NODES are represented by dimlists of (celln, layern, fieldn, etc.)
;; 3. PATHS are represented by dimlists of  (c,l,f,etc  :TO  c,l,f,etc)
;;
;;
;;EXAMPLES
;; NODES/VARS -----------------------------------------------------
;;  X= ("x" (i j f)(XI-J-1 XI-J-2)); LEVEL 1
;;  XI-J-1= ("x" (i j 1)(XI-1-1 XI-2-1 XI-3-1),  ; LEVEL 2
;;  XI-2-1 = ("x" (i 2 1)(X1-2-1 X2-2-1 X3-2-1 X4-2-1 etc)) ;; LEVEL 2 
;;  X2-2-1 = ("x" (2 2 1)  0.77) ;;LEVEL 3
;;
;; PATHS --------------------------------------------------------------
;; NOTE: There are not WUPs at several different layers (as for X,Y), only in designated spots.
;;  WUP = ("Wup" (i 3 f  to i j f)(WI-3-1TOI-1-2 WUPI-3-2TOI-1-3)) ;;LEVEL 1 (Could break this down to to 2 levels, should I???)
;;  WUPI-3-1TOI-1-2=  ("Wup" (i 3 1 to i 1 2)(WUP1-3-1TO1-1-2 WUP2-3-1TO1-1-2 WUP3-3-1TO1-1-2 ... to WUPn1-3-1TO1-1-2 etc WUP1-3-1TO2-1-2 WUP1-3-1TO3-1-2 ... to WUP1-3-1TOn2-1-2))  ;;LEVEL 2, could break down to levels within, but no??
;;  WUP1-3-1TO2-1-2=  ("Wup" (1 3 1 :to 2 1 2)  0.377)

;; FOR VARS such as RESET that have intermediary nodes and may begin or end any with any layer, field, or module, they are treated as nodes or paths.  
;;  Eg. If reset values are EVALUATED as part of XI-2-2 and XI-2-3, then there would be reset syms for each, Eg.
;; RESET= ("reset" (i j f)(RESETI-2-2 RESETI-2-3)) ;;LEVEL 1
;; RESETI-2-2= ("reset" (i 2 2)(RESET1-2-2 RESET2-2-2 RESET3-2-2 etc)) ;;LEVEL 2 
;; RESET2-2-2= ("reset" (2 2 2) nil 0.6) ;;LEVEL 3
;; ===========================================================



;; ART2 CELL/SYMBOL FORMAT -------------------------------------------------------
;; (NOTE: If unbind-global-vars-p = NIL, then * global vars bound, otherwise only local variables by same name returned in values by fun make-new-dimsymbol-types)
;;
;; ART2 CELL NAME LISTS:  EG: new-symbol-type-list= (INPUT WUP)
;;*new-symbols-type-list-of-lists= (((INPUTC1... INPUTC7)) ((WUPC1F1...WUPC2F3) (WUPC3F1...WUPC3F3) (WUPC4F1 ...WUPC4F3)))
;;*new-symbol-type-spec-list-of-lists= (((("inputC1" (7 1 1 "C" "")) ...("inputC7" (7 7 1 "C" "")))) ((("wupC1F1" (3 1 1 "F" "")) ... ("wupC1F3" (3 3 1 "F" ""))) (("wupC2F1" (3 1 1 "F" "")) ... ("wupC2F3" (3 3 1 "F" ""))) (("wupC3F1" (3 1 1 "F" "")) ... ("wupC3F3" (3 3 1 "F" ""))) (("wupC4F1" (3 1 1 "F" "")) ... ("wupC4F3" (3 3 1 "F" "")))))
;;*new-root-list= ("input" "wup")
;;*new-symbol-type-symbol-string-list-of-lists=  ((("inputC1"... "inputC7")) (("wupC1F1" "wupC1F2" "wupC1F3") ("wupC2F1" "wupC2F2" "wupC2F3") ("wupC3F1" "wupC3F2" "wupC3F3") ("wupC4F1" "wupC4F2" "wupC4F3"))) 
;; INPUTC2  =  ("inputC2" (7 2 1 "C" ""))
;; WUPC3F3 =  ("wupC3F3" (3 3 1 "F" ""))
;; *make value 3rd ("inputC2" (7 2 1 "C" "") value)
;;
;; end format ------------------------------------------------------------------------------------
