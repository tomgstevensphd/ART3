;; ************************ TEST-functions.lisp *****************************
;;
;;FILE FOR TESTING NEW--esp complex functions/sets of functions

;;OLD ART2 UPDATEWEIGHTS
(defun updateWeights (nInputs nOutputs);;  &aux i) ;; (j (findLargestOutput)))
    "In ART2.lisp, Updates weights for LTM model."
  (let
      ((j (findLargestOutput))
       (g)
       (p)
       (wdn)
       (wdn0)
       (wup)
       (wup0)
       )
    ;;
    (if (> *print-detail 0)  (afout 'out (format nil "--- IN updateWeights; Largest output j= ~A " j)))
    ;;Step 1: Update wdn
    (setf  g (g  j nOutputs))
    (when  (>  g  *min-g)  ;;was 0.02)
      (loop
       for i from 1 to nInputs
       do
       (setf p (getsymval 'p (list  i))
             wdn0  (getsymval 'wdn (list  j i))
              ;;downLR= 0.8? was 0.12  d= 0.4 ?
             ;;was wdn (my-floor (+ wdn0 (* downLR   d  (-  p  wdn0))) :floor .0001)
             ;;test, prevent wdn from decreasing much
             wdn  (+ wdn0 (* downLR   d  (my-floor (-  p  wdn0) :floor  -0.2))))
       (setsymval 'wdn (list  j i) wdn)    
       (if (= *print-detail 3)  (afout 'out (format nil  "Step 1: FIND wDN FOR j=~a i=~a; wdn (my-floor (+ wdn0 (* downLR   d  (-  p  wdn0))) :floor .0001))=wdn= ~A~%wdn0= ~A downLR= ~A  d= ~A  p= ~A" j i wdn wdn0 downLR d p)))

       ;;Step 2: Update wups
       (setf wup0  (getsymval 'wUp (list i j))
             p (getsymval 'p (list i))
             ;;was wup (my-floor  (+  wup0  (*  upLR    d  (- p  wup0)))  :floor 0.00001 ))
             wup (+ wup0 (* upLR   d  (my-floor (-  p  wup0) :floor  -0.2))))             
                                ;;upLR= 0.8? d=0.4?    
      (setsymval 'wUp (list i j) wup)
      (if (= *print-detail 3)(afout 'out (format nil  "Step 2: FIND wUP FOR i= ~A  j=~a; wup (my-floor (+ wup0 (* upLR   d  (-  p  wup0))) :floor .0001))=wdn= ~A~%wdn0= ~A downLR= ~A  d= ~A  p= ~A" i j wup wup0 upLR d p)))
     ;;end loop
      )
      ;;end when, let, updateWeights
    )))
