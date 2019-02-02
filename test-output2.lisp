(">>>>>>>> NEW ART3 OUTPUT >>>  Date: 2.12.2016  Time: 17:44

CONSTANTS-PARAMETERS:
 *delta-t= 0.1; *n-cycles-per-tdelta= 2 *n-pattern-cycles= 5 
  *p1-all= 10.0; *p2-all= 10.0; *p3-all= 1.0E-4; *p4-3= 0.9; *p5-all= 0.1; *P6-all= 1.0
*def-sigmoid-val= 0.001;  ORIG-ART2:  a= 0.7; b= 0.2; c= -1.0; d= 0.6; e= 0.04; theta= 0.4; *vigilance= 0.9 *vigilance-multiplier= 1.7 
*p1-all= 10.0  *onCenterThreshold= 0.25; *min-input-criteria= 0.2; 
*min-g= 0.02;*reset-y-criteria= 0.4; 
INITIAL VALUES:
 *art-initial-x= 0.01; *art-initial-y= 0.01; Weights: upLR= 0.5 downLR= 0.4; *wUpInitLo= 0.4, *wUpInitHi= 0.5
*wDnInitLo= 0.2 *wDnInitHi= 0.4

*def-nonreset-val= 0; *def-reset-xy-val= 999; *def-comp-val= 0.01
"
 ">> ART3 DESIGN PARAMETERS:
COMPETITION PARAMETERS:  *F3-all-or-none-competative-output-p= T;  *F1-all-or-none-competative-output-p= T;   *F3-compet-every-nth-time-interval= 2;   *test-compet-overall-cycle-nums-list= NIL;   *F3L1-compet-p  
RESET PARAMETERS:= T;   *recalc-F3L1xy-postreset-p= NIL;   *recalc-yi-3-3-postcompet-p= T;   *F2-test-reset-p= T;   *F3-test-reset-p= NIL;   *test-reset-every-nth-pattern-cycle= 2;   *test-reset-every-nth-time-interval= NIL;   *test-reset-overall-cycle-nums-list= NIL;   *reset-all-F1F2-p= T;   *reset-all-F1F2L1-p= NIL;   *reset-all-F1F2L2-p= NIL;   *reset-all-F3Layer-maxs-p= T;   *find-F3L1y-max-output-p= NIL;   *find-F3L3y-max-output-p= T;   *reset-F2-p= NIL;   *reset-XI-1-3-p= NIL;   *reset-XI-2-3-p= NIL;   *reset-XI-3-3-p= NIL   
"
 "

 =========>> NEW INPUT PATTERN =====================
   INPUT PATTERN= ((0 0 0 100 0 0 0 100 100) Dbig)   *pattern-n= 1
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 1  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 100.07832 -0.0029600012 -0.022639998 -0.015120001 99.96296 100.078965);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.9986768E-4 3.5219177E-4 2.5618143E-4 0.57743717 -1.707877E-5 -1.3062945E-4 -8.724017E-5 0.57677156 0.57744086)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 173.31465 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 0.58743716 0.011000001 0.011000001 0.011000001 0.58677155 0.58744085) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.57743717 0.001 0.001 0.001 0.57677156 0.57744086)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.010400958 0.010400958 0.010400958 0.55544627 0.010400958 0.010400958 0.010400958 0.5548169 0.5554498), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 1.0175949"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.55544627 0.001 0.001 0.001 0.5548169 0.5554498), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.55544627 0.001 0.001 0.001 0.5548169 0.5554498)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.981484E-4 9.981484E-4 9.981484E-4 0.5544177 9.981484E-4 9.981484E-4 9.981484E-4 0.55378956 0.55442125),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0018551"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 1 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.5644177 0.011000001 0.011000001 0.011000001 0.56378955 0.56442124)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0177622 after w loop:
; L2norm-xi-1-2= 0.9777622 "
 "
Step 3: FIND yi-1-2-vals=  (0.010808026 0.010808026 0.010808026 0.5545674 0.010808026 0.010808026 0.010808026 0.5539502 0.55457086)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0177622 "
 "
Step 4.2: FIND yi-2-2-vals=(0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.031722777"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.2002 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 4.0040002E-4 6.1120006E-4 8.230001E-4 0.0010978001),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.3165765 0.3166667 0.31681532 0.31670612 0.3166997 0.3168821 0.3167921 0.3168445 0.3163287)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.0010978001"
 "
Step 5: FIND yi-3-2-vals= (0.31969136 0.3197824 0.31993252 0.31982222 0.31981575 0.31999996 0.31990907 0.31996197 0.3194411), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 0.9902567"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 0.5645674 0.011000001 0.011000001 0.011000001 0.5639502 0.56457085)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 1; *pattern-cycle-n= 1 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.2898085 1.3191104 1.2799587 1.2950965 1.2973963) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.1593022 0.2902531 0.43179125 0.559912 0.70223004 0.86210204 1.0114995 1.1665531 1.2973962);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (1.0E-7 1.0E-7 1.0E-7 1.0E-7 1.0E-7);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.9388178 after w loop:
; L2norm-xI-1-3= 2.8988178
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.44494295 0.45505115 0.44154507 0.44676712 0.4475605);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.9388178 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.3191104;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.3191104 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.45505115;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.45505115 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.2973963 1.2973963 1.2973963 1.2973963 1.2973963)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719556 0.44719556 0.44719556 0.44719556 0.44719556);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.2973963 1.2973963 1.2973963 1.2973963 1.2973963)
 L2norm-xI-2-3= 2.9011834
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.45505124 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0021967404 0.9995294 0.0021967404 0.0021967404 0.0021967404);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.45505124 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.4552655
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 1  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.62279 -0.0029600012 -0.022639998 -0.015120001 105.50113 105.62346);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.8937825E-4 3.337081E-4 2.4273656E-4 0.577444 -1.6182445E-5 -1.2377378E-4 -8.2661645E-5 0.5767789 0.57744766)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 182.91434 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.121621 0.011000001 0.011000001 0.011000001 6.1146746 6.12166) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.577444 0.001 0.001 0.001 0.5767789 0.57744766)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.544177 0.010000001 0.010000001 0.010000001 5.5378957 5.5442124)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001033921 0.001033921 0.001033921 0.5753884 0.001033921 0.001033921 0.001033921 0.57473547 0.57539207), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.599112"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.5753884 0.001 0.001 0.001 0.57473547 0.57539207), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.5753884 0.001 0.001 0.001 0.57473547 0.57539207)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648967E-4 9.648967E-4 9.648967E-4 0.5551903 9.648967E-4 9.648967E-4 9.648967E-4 0.5545603 0.5551939),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363804"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 1 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.5651903 0.011000001 0.011000001 0.011000001 0.5645603 0.5651939)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0190988 after w loop:
; L2norm-xi-1-2= 0.9790988 "
 "
Step 3: FIND yi-1-2-vals=  (0.010793852 0.010793852 0.010793852 0.55459816 0.010793852 0.010793852 0.010793852 0.55398 0.55460167)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0190988 "
 "
Step 4.2: FIND yi-2-2-vals=(0.011247126 0.011247126 0.011247126 0.57725096 0.011247126 0.011247126 0.011247126 0.57661987 0.5772545)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.97802765"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.2002 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.12032021 0.12053101 0.120742806 0.121017605),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.13802335 0.22904174 0.22236175 0.7008024 0.14233953 0.22158993 0.21071793 0.78908146 0.6982721)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.121017605"
 "
Step 5: FIND yi-3-2-vals= (0.098930396 0.16416925 0.15938126 0.50231106 0.102024086 0.15882805 0.15103537 0.5655865 0.50049747), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.3951562"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.5777087 0.011000001 0.011000001 0.011000001 6.209845 5.559576)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 5.0231104 0.010000001 0.010000001 0.010000001 5.655865 5.0049744)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 2; *pattern-cycle-n= 1 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0847374 1.0979632 1.0685603 1.0680368 1.0626768) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.049297016 0.116524324 0.18703459 0.38826042 0.43366113 0.51301164 0.58354515 0.85762835 1.0626321);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719556E-5 4.4719556E-5 4.4719556E-5 4.4719556E-5 4.4719556E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.4471903 after w loop:
; L2norm-xI-1-3= 2.4071904
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.45062387 0.45611817 0.4439035 0.44368607 0.4414594);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.4471903 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.0979632;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.0979632 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.45611817;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.45611817 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.0626768 1.0626768 1.0626768 1.0626768 1.0626768)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719082 0.44719082 0.44719082 0.44719082 0.44719082);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.0626768 1.0626768 1.0626768 1.0626768 1.0626768)
 L2norm-xI-2-3= 2.3763385
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.45621812 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0021911257 0.99953127 0.0021911257 0.0021911257 0.0021911257);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.45621812 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.45643207
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 2 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=2  wdn-vals= (0.26861236 0.38398036 0.37531635 0.26435637 0.27393237 0.37425235 0.36057234 0.37698835 0.26162037)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.45611817"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=2  wup-vals= (0.45633236 0.46172836 0.46492037 0.4562564 0.46773234 0.41650838 0.4835404 0.45184836 0.46104434)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.45611817"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 2  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.822205 -0.0029600012 -0.022639998 -0.015120001 105.70031 105.82288);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.8902145E-4 3.330794E-4 2.4227923E-4 0.57744426 -1.6151957E-5 -1.2354058E-4 -8.250591E-5 0.5767791 0.57744796)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.2596 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.1293473 0.011000001 0.011000001 0.011000001 6.122382 6.129387) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.57744426 0.001 0.001 0.001 0.5767791 0.57744796)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.5519033 0.010000001 0.010000001 0.010000001 5.545603 5.551939)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010326232 0.0010326232 0.0010326232 0.5753914 0.0010326232 0.0010326232 0.0010326232 0.57473755 0.5753951), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612483"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.5753914 0.001 0.001 0.001 0.57473755 0.5753951), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.5753914 0.001 0.001 0.001 0.57473755 0.5753951)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648923E-4 9.648923E-4 9.648923E-4 0.5551907 9.648923E-4 9.648923E-4 9.648923E-4 0.55455977 0.55519426),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363852"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 2 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 6.3277 0.011000001 0.011000001 0.011000001 6.3207584 6.3277393)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.772545  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.996052 after w loop:
; L2norm-xi-1-2= 10.956052 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010003592 0.0010003592 0.0010003592 0.575452 0.0010003592 0.0010003592 0.0010003592 0.5748207 0.57545555)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.996052 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0010967981 0.0010967981 0.0010967981 0.5561473 0.0010967981 0.0010967981 0.0010967981 0.61917687 0.5543393)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 10.029194"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.26162037 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.15717243 0.15738324 0.15759504 0.15786985),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.16340043 0.23255962 0.22752123 0.7160325 0.16670862 0.22695102 0.21867103 0.84663147 0.7122091)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.15786985"
 "
Step 5: FIND yi-3-2-vals= (0.11245159 0.1600467 0.1565793 0.49277103 0.11472828 0.15618688 0.15048862 0.58264876 0.49013975), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.4530735"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.5031624 0.011000001 0.011000001 0.011000001 6.401308 5.4768534)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.9277105 0.010000001 0.010000001 0.010000001 5.8264876 4.9013977)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.57744796  max2yI-1-2-val= 0.57545555
"
 "
Step 1.2: FIND  ri-1-2-vals= (-1.1771161E-4 -1.1771161E-4 -1.1771161E-4 0.029991568 -1.1771161E-4 -1.1771161E-4 -1.1771161E-4 -0.080670595 0.033139825)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.57744796,  yi-1-2  max2yi-1-2-val= 0.57545555
 WHERE yi-1-1-vals= (0.0010326232 0.0010326232 0.0010326232 0.5753914 0.0010326232 0.0010326232 0.0010326232 0.57473755 0.5753951)
         and yi-1-2-vals= (0.0010967981 0.0010967981 0.0010967981 0.5561473 0.0010967981 0.0010967981 0.0010967981 0.61917687 0.5543393)"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 2; *tdelta-cycle-n= 1
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399312  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.99953127 (at F3y-max-index= 2)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399312;  initial was-reset-p= NIL; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 0.15787257, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.09286622;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= NIL, res= 0.15787257  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (2.7835617 0 0 1.0673791 0 0 0 0 0)>>> resetnouti-2-2-vals= NIL
  *my-reset-broadcast= NIL    max-Index 2
  *skip-reset= NIL  updated was-reset-p= NIL 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 1.0979632 0.01 0.01 0.01)
                  and xi-2-3-vals= (1.0626768 1.0626768 1.0626768 1.0626768 1.0626768)
                and xi-3-3-vals= (0.0010001 0.45621812 0.0010001 0.0010001 0.0010001); max-xi-1-3= NIL max-xi-2-3= NIL max-xi-3-3= NIL
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.45611817 0.01 0.01 0.01)
                  and yi-2-3-vals= (0.44719082 0.44719082 0.44719082 0.44719082 0.44719082)
                and yi-3-3-vals= (0.0021911257 0.99953127 0.0021911257 0.0021911257 0.0021911257)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 3; *pattern-cycle-n= 2 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0915797 1.1036126 1.0722754 1.0750803 1.0707692) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.05603463 0.121573746 0.19084443 0.3882485 0.4393026 0.51733357 0.58761174 0.8699633 1.0707245);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471908E-5 4.471908E-5 4.471908E-5 4.471908E-5 4.471908E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.1036126;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.1036126 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.45621812;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.45621812 0.01 0.01 0.01)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.45621812;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.45621812 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.99953127;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.01 0.99953127 0.01 0.01 0.01)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.143939 after w loop:
; L2norm-xI-1-3= 1.103939
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.009058471 0.99970425 0.009058471 0.009058471 0.009058471);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.143939 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.1036126;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.1036126 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.99970425;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.99970425 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.0707692 1.0707692 1.0707692 1.0707692 1.0707692)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719103 0.44719103 0.44719103 0.44719103 0.44719103);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.0707692 1.0707692 1.0707692 1.0707692 1.0707692)
 L2norm-xI-2-3= 2.3944335
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.9998042 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010001438 0.99984795 0.0010001438 0.0010001438 0.0010001438);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.9998042 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.99995625
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 2  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.822235 -0.0029600012 -0.022639998 -0.015120001 105.70033 105.822914);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.890214E-4 3.330793E-4 2.4227918E-4 0.5774443 -1.6151953E-5 -1.2354055E-4 -8.2505896E-5 0.5767791 0.577448)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.25965 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.1293507 0.011000001 0.011000001 0.011000001 6.1223765 6.1293907) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.5774443 0.001 0.001 0.001 0.5767791 0.577448)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.5519066 0.010000001 0.010000001 0.010000001 5.5455976 5.551943)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010326231 0.0010326231 0.0010326231 0.5753917 0.0010326231 0.0010326231 0.0010326231 0.57473696 0.57539547), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612484"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.5753917 0.001 0.001 0.001 0.57473696 0.57539547), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.5753917 0.001 0.001 0.001 0.57473696 0.57539547)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648923E-4 9.648923E-4 9.648923E-4 0.555191 9.648923E-4 9.648923E-4 9.648923E-4 0.55455924 0.5551946),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363852"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 2 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 6.116664 0.011000001 0.011000001 0.011000001 6.746328 6.098588)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.543393  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 11.000032 after w loop:
; L2norm-xi-1-2= 10.960032 "
 "
Step 3: FIND yi-1-2-vals=  (9.999971E-4 9.999971E-4 9.999971E-4 0.5560587 9.999971E-4 9.999971E-4 9.999971E-4 0.61330075 0.55441547)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 11.000032 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0010931332 0.0010931332 0.0010931332 0.54688085 0.0010931332 0.0010931332 0.0010931332 0.63613475 0.5442664)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 10.062818"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.26162037 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.15717243 0.15738324 0.15759504 0.15786985),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.16339676 0.23255596 0.22751756 0.70676607 0.16670496 0.22694735 0.21866736 0.86358935 0.7021363)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.15786985"
 "
Step 5: FIND yi-3-2-vals= (0.11240631 0.15998334 0.15651724 0.48620898 0.11468214 0.15612498 0.15042888 0.59409315 0.48302397), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.4536262"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.4181485 0.011000001 0.011000001 0.011000001 6.554232 5.384655)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.8620896 0.010000001 0.010000001 0.010000001 5.9409313 4.83024)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.577448  max2yI-1-2-val= 0.61330075
"
 "
Step 1.2: FIND  ri-1-2-vals= (5.8758306E-6 5.8758306E-6 5.8758306E-6 0.10473806 5.8758306E-6 5.8758306E-6 5.8758306E-6 -0.041926206 0.10900742)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.577448,  yi-1-2  max2yi-1-2-val= 0.61330075
 WHERE yi-1-1-vals= (0.0010326231 0.0010326231 0.0010326231 0.5753917 0.0010326231 0.0010326231 0.0010326231 0.57473696 0.57539547)
         and yi-1-2-vals= (0.0010931332 0.0010931332 0.0010931332 0.54688085 0.0010931332 0.0010931332 0.0010931332 0.63613475 0.5442664)"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 2; *tdelta-cycle-n= 2
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399313  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.99984795 (at F3y-max-index= 2)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399313;  initial was-reset-p= NIL; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 0.26740268, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.15729569;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= NIL, res= 0.26740268  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (2.7835617 0 0 1.0673791 0 0 0 0 0)>>> resetnouti-2-2-vals= NIL
  *my-reset-broadcast= NIL    max-Index 2
  *skip-reset= NIL  updated was-reset-p= NIL 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 1.1036126 0.01 0.01 0.01)
                  and xi-2-3-vals= (1.0707692 1.0707692 1.0707692 1.0707692 1.0707692)
                and xi-3-3-vals= (0.0010001 0.9998042 0.0010001 0.0010001 0.0010001); max-xi-1-3= NIL max-xi-2-3= NIL max-xi-3-3= NIL
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.99970425 0.01 0.01 0.01)
                  and yi-2-3-vals= (0.44719103 0.44719103 0.44719103 0.44719103 0.44719103)
                and yi-3-3-vals= (0.0010001438 0.99984795 0.0010001438 0.0010001438 0.0010001438)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 4; *pattern-cycle-n= 2 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0909368 1.102354 1.0703476 1.0749179 1.0706165) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.056012068 0.12152524 0.19076848 0.38554382 0.43657738 0.5145774 0.58482767 0.8727252 1.0705718);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.47191E-5 4.47191E-5 4.47191E-5 4.47191E-5 4.47191E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.102354;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.102354 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.9998042;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.9998042 0.01 0.01 0.01)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.9998042;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.9998042 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.99984795;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.01 0.99984795 0.01 0.01 0.01)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.1426809 after w loop:
; L2norm-xI-1-3= 1.1026809
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.009068807 0.9997036 0.009068807 0.009068807 0.009068807);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.1426809 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.102354;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.102354 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.9997036;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.9997036 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.0706165 1.0706165 1.0706165 1.0706165 1.0706165)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719103 0.44719103 0.44719103 0.44719103 0.44719103);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.0706165 1.0706165 1.0706165 1.0706165 1.0706165)
 L2norm-xI-2-3= 2.394092
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.99980355 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010001444 0.99984795 0.0010001444 0.0010001444 0.0010001444);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.99980355 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.9999556
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 2 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=2  wdn-vals= (0.44407427 0.53175396 0.5251693 0.4408397 0.44811746 0.52436066 0.5139638 0.52644 0.43876034)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997036"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=2  wup-vals= (0.58674145 0.5908424 0.59326834 0.58668375 0.59540546 0.5564752 0.60741956 0.5833336 0.59032256)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997036"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 3  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.822235 -0.0029600012 -0.022639998 -0.015120001 105.700325 105.822914);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.890214E-4 3.330793E-4 2.4227918E-4 0.5774443 -1.6151953E-5 -1.2354055E-4 -8.2505896E-5 0.57677907 0.577448)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.25965 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.1293545 0.011000001 0.011000001 0.011000001 6.122371 6.129394) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.5774443 0.001 0.001 0.001 0.57677907 0.577448)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.55191 0.010000001 0.010000001 0.010000001 5.5455923 5.551946)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001032623 0.001032623 0.001032623 0.575392 0.001032623 0.001032623 0.001032623 0.5747364 0.5753957), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612485"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.575392 0.001 0.001 0.001 0.5747364 0.5753957), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.575392 0.001 0.001 0.001 0.5747364 0.5753957)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648923E-4 9.648923E-4 9.648923E-4 0.5551913 9.648923E-4 9.648923E-4 9.648923E-4 0.5545587 0.55519486),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363852"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 3 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 6.023999 0.011000001 0.011000001 0.011000001 6.915906 5.997859)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.442664  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.9988165 after w loop:
; L2norm-xi-1-2= 10.958817 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010001077 0.0010001077 0.0010001077 0.5476952 0.0010001077 0.0010001077 0.0010001077 0.6287864 0.5453186)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.9988165 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0010928563 0.0010928563 0.0010928563 0.5382961 0.0010928563 0.0010928563 0.0010928563 0.6511666 0.5349685)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 10.065369"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.43876034 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.26345643 0.26366723 0.26387903 0.26415384),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.2686736 0.32121986 0.31742904 0.8040713 0.27121577 0.31701207 0.31070197 0.96829224 0.79912234)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.26415384"
 "
Step 5: FIND yi-3-2-vals= (0.15764524 0.18847697 0.18625269 0.47179186 0.15913688 0.18600802 0.18230555 0.56814915 0.46888804), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.7042924"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.2656136 0.011000001 0.011000001 0.011000001 6.310278 5.234199)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.7179184 0.010000001 0.010000001 0.010000001 5.6814914 4.6888805)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 5; *pattern-cycle-n= 3 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1593688 1.5084037 1.1390156 1.1461761 1.1434425) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.07855462 0.15573594 0.23813413 0.42713398 0.4979499 0.5908795 0.6760162 0.9513413 1.1433978);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.47191E-5 4.47191E-5 4.47191E-5 4.47191E-5 4.47191E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.7856517 after w loop:
; L2norm-xI-1-3= 2.7456518
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.42225632 0.5493791 0.4148434 0.41745138 0.41645578);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.7856517 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.5084037;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.5084037 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.5493791;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.5493791 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1434425 1.1434425 1.1434425 1.1434425 1.1434425)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4471927 0.4471927 0.4471927 0.4471927 0.4471927);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1434425 1.1434425 1.1434425 1.1434425 1.1434425)
 L2norm-xI-2-3= 2.5569346
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.54947907 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0018194431 0.9996458 0.0018194431 0.0018194431 0.0018194431);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.54947907 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.54967374
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 3  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.82224 -0.0029600012 -0.022639998 -0.015120001 105.70032 105.82292);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.890214E-4 3.330793E-4 2.4227918E-4 0.5774443 -1.6151953E-5 -1.2354055E-4 -8.2505896E-5 0.576779 0.577448)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.25965 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.1293573 0.011000001 0.011000001 0.011000001 6.122366 6.1293965) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.5774443 0.001 0.001 0.001 0.576779 0.577448)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.551913 0.010000001 0.010000001 0.010000001 5.545587 5.5519486)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001032623 0.001032623 0.001032623 0.57539225 0.001032623 0.001032623 0.001032623 0.57473594 0.57539595), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612485"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.57539225 0.001 0.001 0.001 0.57473594 0.57539595), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.57539225 0.001 0.001 0.001 0.57473594 0.57539595)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648923E-4 9.648923E-4 9.648923E-4 0.5551915 9.648923E-4 9.648923E-4 9.648923E-4 0.5545582 0.5551951),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363852"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 3 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 5.938153 0.011000001 0.011000001 0.011000001 7.0662246 5.9048796)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.3496847  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.997363 after w loop:
; L2norm-xi-1-2= 10.957363 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010002399 0.0010002399 0.0010002399 0.5399615 0.0010002399 0.0010002399 0.0010002399 0.6425381 0.5369359)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.997363 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011288978 0.0011288978 0.0011288978 0.5403944 0.0011288978 0.0011288978 0.0011288978 0.6476053 0.53717047)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.744019"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.43876034 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.26345643 0.26366723 0.26387903 0.26415384),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.26870966 0.32125592 0.3174651 0.8061696 0.27125183 0.31704813 0.31073803 0.9647309 0.8013243)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.26415384"
 "
Step 5: FIND yi-3-2-vals= (0.15766227 0.18849318 0.18626896 0.47301066 0.15915387 0.18602431 0.18232192 0.5660446 0.47016773), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.7043371"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.2700677 0.011000001 0.011000001 0.011000001 6.302984 5.238613)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.7301064 0.010000001 0.010000001 0.010000001 5.660446 4.7016773)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 6; *pattern-cycle-n= 3 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1594962 1.5087049 1.1393774 1.1462158 1.1434808) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.07856312 0.15575108 0.23815647 0.42764455 0.498468 0.59140575 0.6765501 0.9508553 1.1434361);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471927E-5 4.471927E-5 4.471927E-5 4.471927E-5 4.471927E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.7860534 after w loop:
; L2norm-xI-1-3= 2.7460535
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.42224094 0.54940844 0.4149145 0.41740477 0.41640878);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.7860534 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.5087049;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.5087049 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.54940844;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.54940844 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1434808 1.1434808 1.1434808 1.1434808 1.1434808)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4471927 0.4471927 0.4471927 0.4471927 0.4471927);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1434808 1.1434808 1.1434808 1.1434808 1.1434808)
 L2norm-xI-2-3= 2.5570202
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.5495084 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.001819346 0.9996459 0.001819346 0.001819346 0.001819346);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.5495084 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.54970307
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 2 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=2  wdn-vals= (0.46935448 0.535991 0.5309867 0.4668962 0.4724273 0.53037215 0.52247054 0.53195245 0.46531588)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.54940844"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=2  wup-vals= (0.5777815 0.5808983 0.582742 0.5777377 0.5843662 0.5547792 0.59349686 0.57519156 0.58050317)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.54940844"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 4  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.82224 -0.0029600012 -0.022639998 -0.015120001 105.70032 105.82292);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.890214E-4 3.330793E-4 2.4227918E-4 0.5774443 -1.6151953E-5 -1.2354055E-4 -8.2505896E-5 0.576779 0.577448)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.25965 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.1293593 0.011000001 0.011000001 0.011000001 6.122361 6.129399) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.5774443 0.001 0.001 0.001 0.576779 0.577448)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.551915 0.010000001 0.010000001 0.010000001 5.5455823 5.551951)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001032623 0.001032623 0.001032623 0.5753924 0.001032623 0.001032623 0.001032623 0.5747355 0.5753962), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612485"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.5753924 0.001 0.001 0.001 0.5747355 0.5753962), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.5753924 0.001 0.001 0.001 0.5747355 0.5753962)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648923E-4 9.648923E-4 9.648923E-4 0.5551917 9.648923E-4 9.648923E-4 9.648923E-4 0.55455786 0.5551953),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363852"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 4 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 5.9591355 0.011000001 0.011000001 0.011000001 7.030611 5.9269)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.3717046  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.997735 after w loop:
; L2norm-xi-1-2= 10.957735 "
 "
Step 3: FIND yi-1-2-vals=  (0.001000206 0.001000206 0.001000206 0.54185117 0.001000206 0.001000206 0.001000206 0.6392781 0.53892005)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.997735 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011288908 0.0011288908 0.0011288908 0.54084826 0.0011288908 0.0011288908 0.0011288908 0.6468528 0.5376202)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.744079"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.46531588 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.27938974 0.27960053 0.27981234 0.28008714),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.28387776 0.32379812 0.32095552 0.8222574 0.28583768 0.320655 0.31584203 0.9672859 0.8177073)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.28008714"
 "
Step 5: FIND yi-3-2-vals= (0.16416265 0.18724805 0.18560422 0.47550026 0.16529605 0.18543042 0.18264716 0.55936826 0.472869), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.729247"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.2968536 0.011000001 0.011000001 0.011000001 6.23296 5.26761)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.7550025 0.010000001 0.010000001 0.010000001 5.5936823 4.72869)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.577448  max2yI-1-2-val= 0.6392781
"
 "
Step 1.2: FIND  ri-1-2-vals= (2.2369088E-5 2.2369088E-5 2.2369088E-5 0.15041054 2.2369088E-5 2.2369088E-5 2.2369088E-5 -0.01654619 0.15546662)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.577448,  yi-1-2  max2yi-1-2-val= 0.6392781
 WHERE yi-1-1-vals= (0.001032623 0.001032623 0.001032623 0.5753924 0.001032623 0.001032623 0.001032623 0.5747355 0.5753962)
         and yi-1-2-vals= (0.0011288908 0.0011288908 0.0011288908 0.54084826 0.0011288908 0.0011288908 0.0011288908 0.6468528 0.5376202)"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 4; *tdelta-cycle-n= 1
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399312  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.9996459 (at F3y-max-index= 2)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399312;  initial was-reset-p= NIL; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 0.3693753, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.21727959;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= NIL, res= 0.3693753  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (2.7835617 0 0 1.0673791 0 0 0 0 0)>>> resetnouti-2-2-vals= NIL
  *my-reset-broadcast= NIL    max-Index 2
  *skip-reset= NIL  updated was-reset-p= NIL 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 1.5087049 0.01 0.01 0.01)
                  and xi-2-3-vals= (1.1434808 1.1434808 1.1434808 1.1434808 1.1434808)
                and xi-3-3-vals= (0.0010001 0.5495084 0.0010001 0.0010001 0.0010001); max-xi-1-3= NIL max-xi-2-3= NIL max-xi-3-3= NIL
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.54940844 0.01 0.01 0.01)
                  and yi-2-3-vals= (0.4471927 0.4471927 0.4471927 0.4471927 0.4471927)
                and yi-3-3-vals= (0.001819346 0.9996459 0.001819346 0.001819346 0.001819346)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 7; *pattern-cycle-n= 4 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1632972 1.4906534 1.1433159 1.1496438 1.1473727) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.08180225 0.15848032 0.24059162 0.431077 0.5046337 0.5972748 0.682571 0.9536408 1.147328);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471927E-5 4.471927E-5 4.471927E-5 4.471927E-5 4.471927E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.4906534;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.4906534 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.5495084;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.5495084 0.01 0.01 0.01)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.5495084;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.5495084 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.9996459;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.01 0.9996459 0.01 0.01 0.01)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.530921 after w loop:
; L2norm-xI-1-3= 1.490921
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.006707263 0.9998205 0.006707263 0.006707263 0.006707263);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.530921 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.4906534;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.4906534 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.9998205;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.9998205 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1473727 1.1473727 1.1473727 1.1473727 1.1473727)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719276 0.44719276 0.44719276 0.44719276 0.44719276);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1473727 1.1473727 1.1473727 1.1473727 1.1473727)
 L2norm-xI-2-3= 2.565723
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.9999204 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010000275 0.99984795 0.0010000275 0.0010000275 0.0010000275);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.9999204 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 1.0000725
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 4  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.82224 -0.0029600012 -0.022639998 -0.015120001 105.70031 105.82292);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.890214E-4 3.330793E-4 2.4227918E-4 0.5774443 -1.6151953E-5 -1.2354055E-4 -8.2505896E-5 0.57677895 0.577448)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.25965 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.129361 0.011000001 0.011000001 0.011000001 6.1223574 6.1294007) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.5774443 0.001 0.001 0.001 0.57677895 0.577448)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.551917 0.010000001 0.010000001 0.010000001 5.5455785 5.551953)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001032623 0.001032623 0.001032623 0.5753926 0.001032623 0.001032623 0.001032623 0.57473517 0.57539636), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612485"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.5753926 0.001 0.001 0.001 0.57473517 0.57539636), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.5753926 0.001 0.001 0.001 0.57473517 0.57539636)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648923E-4 9.648923E-4 9.648923E-4 0.5551919 9.648923E-4 9.648923E-4 9.648923E-4 0.5545575 0.55519546),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363852"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 4 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 5.9636746 0.011000001 0.011000001 0.011000001 7.023085 5.931397)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.3762016  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.997811 after w loop:
; L2norm-xi-1-2= 10.957811 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010001991 0.0010001991 0.0010001991 0.5422601 0.0010001991 0.0010001991 0.0010001991 0.6385893 0.53932524)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.997811 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011306196 0.0011306196 0.0011306196 0.54442966 0.0011306196 0.0011306196 0.0011306196 0.64064605 0.54142386)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.729179"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.46531588 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.27938974 0.27960053 0.27981234 0.28008714),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.2838795 0.32379985 0.32095724 0.8258388 0.2858394 0.32065672 0.31584376 0.9610791 0.82151103)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.28008714"
 "
Step 5: FIND yi-3-2-vals= (0.16415872 0.18724342 0.18559963 0.477557 0.16529207 0.18542585 0.18264266 0.5557623 0.47505438), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.729299"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.31783 0.011000001 0.011000001 0.011000001 6.1962123 5.289869)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.77557 0.010000001 0.010000001 0.010000001 5.557623 4.7505436)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.577448  max2yI-1-2-val= 0.6385893
"
 "
Step 1.2: FIND  ri-1-2-vals= (1.7757179E-5 1.7757179E-5 1.7757179E-5 0.14389003 1.7757179E-5 1.7757179E-5 1.7757179E-5 -0.007918656 0.14860344)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.577448,  yi-1-2  max2yi-1-2-val= 0.6385893
 WHERE yi-1-1-vals= (0.001032623 0.001032623 0.001032623 0.5753926 0.001032623 0.001032623 0.001032623 0.57473517 0.57539636)
         and yi-1-2-vals= (0.0011306196 0.0011306196 0.0011306196 0.54442966 0.0011306196 0.0011306196 0.0011306196 0.64064605 0.54142386)"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 4; *tdelta-cycle-n= 2
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399312  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.99984795 (at F3y-max-index= 2)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399312;  initial was-reset-p= NIL; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 0.3524846, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.20734389;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= NIL, res= 0.3524846  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (2.7835617 0 0 1.0673791 0 0 0 0 0)>>> resetnouti-2-2-vals= NIL
  *my-reset-broadcast= NIL    max-Index 2
  *skip-reset= NIL  updated was-reset-p= NIL 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 1.4906534 0.01 0.01 0.01)
                  and xi-2-3-vals= (1.1473727 1.1473727 1.1473727 1.1473727 1.1473727)
                and xi-3-3-vals= (0.0010001 0.9999204 0.0010001 0.0010001 0.0010001); max-xi-1-3= NIL max-xi-2-3= NIL max-xi-3-3= NIL
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.9998205 0.01 0.01 0.01)
                  and yi-2-3-vals= (0.44719276 0.44719276 0.44719276 0.44719276 0.44719276)
                and yi-3-3-vals= (0.0010000275 0.99984795 0.0010000275 0.0010000275 0.0010000275)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 8; *pattern-cycle-n= 4 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.163411 1.491021 1.1438311 1.1496062 1.1473323) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.08180029 0.15847647 0.24058575 0.43189508 0.50545007 0.5980888 0.6833829 0.9527054 1.1472876);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719276E-5 4.4719276E-5 4.4719276E-5 4.4719276E-5 4.4719276E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.491021;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.491021 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.9999204;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.9999204 0.01 0.01 0.01)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.9999204;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.9999204 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.99984795;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.01 0.99984795 0.01 0.01 0.01)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.5312886 after w loop:
; L2norm-xI-1-3= 1.4912887
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.0067056096 0.99982054 0.0067056096 0.0067056096 0.0067056096);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.5312886 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.491021;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.491021 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.99982054;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.99982054 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1473323 1.1473323 1.1473323 1.1473323 1.1473323)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4471928 0.4471928 0.4471928 0.4471928 0.4471928);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1473323 1.1473323 1.1473323 1.1473323 1.1473323)
 L2norm-xI-2-3= 2.5656324
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.9999205 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010000275 0.999848 0.0010000275 0.0010000275 0.0010000275);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.9999205 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 1.0000725
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 2 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=2  wdn-vals= (0.59666634 0.6473101 0.6435068 0.594798 0.5990017 0.64303977 0.63703454 0.6442408 0.593597)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.99982054"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=2  wup-vals= (0.6790709 0.68143964 0.6828408 0.6790376 0.68407524 0.6615891 0.6910145 0.6771025 0.68113935)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.99982054"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 5  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.82225 -0.0029600012 -0.022639998 -0.015120001 105.70031 105.82292);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.890214E-4 3.330793E-4 2.4227918E-4 0.5774444 -1.6151953E-5 -1.2354055E-4 -8.2505896E-5 0.57677895 0.577448)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.25965 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.1293635 0.011000001 0.011000001 0.011000001 6.122354 6.129402) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.5774444 0.001 0.001 0.001 0.57677895 0.577448)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.551919 0.010000001 0.010000001 0.010000001 5.545575 5.5519543)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001032623 0.001032623 0.001032623 0.57539285 0.001032623 0.001032623 0.001032623 0.5747348 0.5753965), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612485"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.57539285 0.001 0.001 0.001 0.5747348 0.5753965), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.57539285 0.001 0.001 0.001 0.5747348 0.5753965)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648923E-4 9.648923E-4 9.648923E-4 0.55519206 9.648923E-4 9.648923E-4 9.648923E-4 0.55455715 0.55519557),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363852"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 5 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 5.999489 0.011000001 0.011000001 0.011000001 6.9610176 5.969434)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.4142385  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.998412 after w loop:
; L2norm-xi-1-2= 10.958412 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010001444 0.0010001444 0.0010001444 0.5454868 0.0010001444 0.0010001444 0.0010001444 0.63291115 0.5427542)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.998412 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011306142 0.0011306142 0.0011306142 0.54658306 0.0011306142 0.0011306142 0.0011306142 0.6368659 0.5437091)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.729226"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.593597 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.3563584 0.3565692 0.356781 0.3570558),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.3602666 0.3905913 0.3884693 0.90473325 0.36178407 0.3882573 0.38458216 1.024672 0.90076495)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.3570558"
 "
Step 5: FIND yi-3-2-vals= (0.18741195 0.20318698 0.20208311 0.47064543 0.18820136 0.20197281 0.200061 0.533038 0.4685811), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.9223245"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.251941 0.011000001 0.011000001 0.011000001 5.9632917 5.228565)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.7064543 0.010000001 0.010000001 0.010000001 5.3303805 4.685811)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 9; *pattern-cycle-n= 5 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1967348 1.8040493 1.178167 1.1844176 1.1829041) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.09338738 0.17659244 0.265994 0.4545346 0.5382842 0.6391898 0.7326183 0.99092854 1.1828594);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719276E-5 4.4719276E-5 4.4719276E-5 4.4719276E-5 4.4719276E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  3.0195382 after w loop:
; L2norm-xI-1-3= 2.9795382
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.40165108 0.6054795 0.39541933 0.39751717 0.39700922);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 3.0195382 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.8040493;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.8040493 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.6054795;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.6054795 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1829041 1.1829041 1.1829041 1.1829041 1.1829041)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4471935 0.4471935 0.4471935 0.4471935 0.4471935);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1829041 1.1829041 1.1829041 1.1829041 1.1829041)
 L2norm-xI-2-3= 2.6451729
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.60557944 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0016509694 0.9996931 0.0016509694 0.0016509694 0.0016509694);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.60557944 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.60576535
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 5  *n-pattern-cycles= 5;
 INPUT-VALS= (0.024639994 0.051039994 0.034399994 100.06832 -0.012960002 -0.03264 -0.025120002 99.95296 100.06896)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.034639996 0.061039996 0.044399996 105.82225 -0.0029600012 -0.022639998 -0.015120001 105.7003 105.82293);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.890214E-4 3.330793E-4 2.4227918E-4 0.5774444 -1.6151953E-5 -1.2354055E-4 -8.2505896E-5 0.57677895 0.57744807)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 183.25965 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.129365 0.011000001 0.011000001 0.011000001 6.12235 6.1294036) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.5774444 0.001 0.001 0.001 0.57677895 0.57744807)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.5519204 0.010000001 0.010000001 0.010000001 5.5455713 5.5519557)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001032623 0.001032623 0.001032623 0.57539297 0.001032623 0.001032623 0.001032623 0.57473445 0.5753966), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612485"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.57539297 0.001 0.001 0.001 0.57473445 0.5753966), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.57539297 0.001 0.001 0.001 0.57473445 0.5753966)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648924E-4 9.648924E-4 9.648924E-4 0.55519224 9.648924E-4 9.648924E-4 9.648924E-4 0.55455685 0.55519575),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.036385"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 5 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 6.021023 0.011000001 0.011000001 0.011000001 6.923216 5.9922867)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.437091  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.998748 after w loop:
; L2norm-xi-1-2= 10.958748 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010001139 0.0010001139 0.0010001139 0.547428 0.0010001139 0.0010001139 0.0010001139 0.6294549 0.54481537)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.998748 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011563944 0.0011563944 0.0011563944 0.55211956 0.0011563944 0.0011563944 0.0011563944 0.6269015 0.5496621)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.512326"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.593597 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.3563584 0.3565692 0.356781 0.3570558),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.36029238 0.39061707 0.3884951 0.91026974 0.36180985 0.38828307 0.38460794 1.0147076 0.9067179)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.3570558"
 "
Step 5: FIND yi-3-2-vals= (0.1874097 0.2031834 0.20207963 0.47348595 0.18819903 0.20196934 0.20005769 0.52781034 0.4716384), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.9224852"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.2822876 0.011000001 0.011000001 0.011000001 5.9075585 5.2611995)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.7348595 0.010000001 0.010000001 0.010000001 5.2781034 4.716384)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 10; *pattern-cycle-n= 5 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1967977 1.8045082 1.1788061 1.1842694 1.1827524) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.093386255 0.17658985 0.26598987 0.45566833 0.5394169 0.6403208 0.7337477 0.9895246 1.1827077);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471935E-5 4.471935E-5 4.471935E-5 4.471935E-5 4.471935E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  3.019975 after w loop:
; L2norm-xI-1-3= 2.979975
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.40161335 0.60554475 0.39557582 0.39740917 0.3969001);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 3.019975 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.8045082;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.8045082 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.60554475;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.60554475 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1827524 1.1827524 1.1827524 1.1827524 1.1827524)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4471935 0.4471935 0.4471935 0.4471935 0.4471935);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1827524 1.1827524 1.1827524 1.1827524 1.1827524)
 L2norm-xI-2-3= 2.6448336
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.6056447 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0016507915 0.99969316 0.0016507915 0.0016507915 0.0016507915);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.6056447 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.6058306
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 2 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=2  wdn-vals= (0.59879715 0.6372864 0.6343959 0.59737725 0.60057205 0.63404096 0.62947697 0.63495374 0.59646446)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.60554475"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=2  wup-vals= (0.66142464 0.6632249 0.6642898 0.6613993 0.6652279 0.64813847 0.67050177 0.6599286 0.66299665)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.60554475"
 "
==>> END UPDATE WEIGHTS ==========
"
 "

 =========>> NEW INPUT PATTERN =====================
   INPUT PATTERN= ((0 0 0 100 0 0 0 0 0) Abig)   *pattern-n= 2
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 1  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 105.71281 0.035760004 -0.05016 -0.022799999 5.6742244 5.7629256);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.15404386E-4 -2.1044319E-4 9.4284616E-5 0.99670905 3.371618E-4 -4.7293157E-4 -2.149689E-4 0.053499204 0.05433552)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 106.06185 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 6.548631 0.011000001 0.011000001 0.011000001 5.5465684 5.5529575) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.99670905 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 5.5519223 0.010000001 0.010000001 0.010000001 5.5455685 5.5519576)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010719266 0.0010719266 0.0010719266 0.6381501 0.0010719266 0.0010719266 0.0010719266 0.54050124 0.5411238), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.221898"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.6381501 0.001 0.001 0.001 0.54050124 0.5411238), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.6381501 0.001 0.001 0.001 0.54050124 0.5411238)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.650259E-4 9.650259E-4 9.650259E-4 0.6158314 9.650259E-4 9.650259E-4 9.650259E-4 0.5215977 0.5221985),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0362417"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 1 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 6.137027 0.011000001 0.011000001 0.011000001 6.790613 6.01882)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.496621  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.994668 after w loop:
; L2norm-xi-1-2= 10.954668 "
 "
Step 3: FIND yi-1-2-vals=  (0.001000485 0.001000485 0.001000485 0.5581821 0.001000485 0.001000485 0.001000485 0.61762786 0.5474308)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.994668 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011563917 0.0011563917 0.0011563917 0.55530847 0.0011563917 0.0011563917 0.0011563917 0.621041 0.5530916)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.512348"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59646446 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.3580789 0.3582897 0.3585015 0.3587763),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.36157087 0.38460287 0.38302854 0.91500617 0.36275205 0.3828838 0.3800734 1.0032749 0.91186786)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.3587763"
 "
Step 5: FIND yi-3-2-vals= (0.1885957 0.20060922 0.19978805 0.47726807 0.18921182 0.19971255 0.19824665 0.5233091 0.47563112), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.9171745"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.330863 0.011000001 0.011000001 0.011000001 5.8507195 5.3037424)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.7726808 0.010000001 0.010000001 0.010000001 5.2330914 4.7563114)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 11; *pattern-cycle-n= 1 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1950871 1.7551411 1.1773983 1.182052 1.1807221) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.093977235 0.17612672 0.26451296 0.45570654 0.5399058 0.6396822 0.7322633 0.9858589 1.1806774);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471935E-5 4.471935E-5 4.471935E-5 4.471935E-5 4.471935E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.987382 after w loop:
; L2norm-xI-1-3= 2.947382
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.4054741 0.5954916 0.3994726 0.40105152 0.4006003);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.987382 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.7551411;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.7551411 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.5954916;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.5954916 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1807221 1.1807221 1.1807221 1.1807221 1.1807221)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719344 0.44719344 0.44719344 0.44719344 0.44719344);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1807221 1.1807221 1.1807221 1.1807221 1.1807221)
 L2norm-xI-2-3= 2.6402939
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.59559155 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.001678643 0.9996856 0.001678643 0.001678643 0.001678643);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.59559155 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.5957789
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 1  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 106.34038 0.035760004 -0.05016 -0.022799999 5.331892 5.420198);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.1476585E-4 -2.092788E-4 9.376293E-5 0.9970785 3.3529627E-4 -4.7031482E-4 -2.1377945E-4 0.04999338 0.05082136)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 106.65196 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 7.155392 0.011000001 0.011000001 0.011000001 5.2169767 5.222985) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.9970785 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 6.1583138 0.010000001 0.010000001 0.010000001 5.2159767 5.221985)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010657883 0.0010657883 0.0010657883 0.6932848 0.0010657883 0.0010657883 0.0010657883 0.50547207 0.50605417), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.280999"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.6932848 0.001 0.001 0.001 0.50547207 0.50605417), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.6932848 0.001 0.001 0.001 0.50547207 0.50605417)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.65005E-4 9.65005E-4 9.65005E-4 0.66902334 9.65005E-4 9.65005E-4 9.65005E-4 0.48778307 0.4883448),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0362641"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 1 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 6.222108 0.011000001 0.011000001 0.011000001 6.698193 6.0192604)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.5309157  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.986001 after w loop:
; L2norm-xi-1-2= 10.946001 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010012743 0.0010012743 0.0010012743 0.566367 0.0010012743 0.0010012743 0.0010012743 0.6097026 0.54790277)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.986001 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011545007 0.0011545007 0.0011545007 0.5594986 0.0011545007 0.0011545007 0.0011545007 0.6140599 0.5566521)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.527929"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59646446 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.3580789 0.3582897 0.3585015 0.3587763),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.361569 0.384601 0.38302666 0.91919637 0.36275017 0.3828819 0.38007152 0.9962938 0.9154284)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.3587763"
 "
Step 5: FIND yi-3-2-vals= (0.18858886 0.20060201 0.19978085 0.47943878 0.18920495 0.19970536 0.1982395 0.5196516 0.47747347), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.9172341"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.360755 0.011000001 0.011000001 0.011000001 5.8062186 5.322637)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.794388 0.010000001 0.010000001 0.010000001 5.196516 4.7747345)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 12; *pattern-cycle-n= 1 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1950697 1.7553564 1.1777661 1.1818882 1.1805544) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.09397383 0.17612036 0.26450342 0.4565666 0.5407628 0.6405356 0.73311347 0.9849366 1.1805097);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471934E-5 4.471934E-5 4.471934E-5 4.471934E-5 4.471934E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.9875174 after w loop:
; L2norm-xI-1-3= 2.9475174
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.40544957 0.59553725 0.39957902 0.40097752 0.400525);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.9875174 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.7553564;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.7553564 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.59553725;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.59553725 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1805544 1.1805544 1.1805544 1.1805544 1.1805544)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719344 0.44719344 0.44719344 0.44719344 0.44719344);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1805544 1.1805544 1.1805544 1.1805544 1.1805544)
 L2norm-xI-2-3= 2.6399188
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.5956372 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0016785144 0.9996856 0.0016785144 0.0016785144 0.0016785144);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.5956372 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.59582454
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 2 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=2  wdn-vals= (0.5980148 0.62726665 0.6250698 0.59693563 0.5993637 0.6248001 0.62133146 0.62549377 0.59624196)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.59553725"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=2  wup-vals= (0.64561165 0.64697987 0.6477892 0.6455924 0.6485021 0.6355142 0.6525103 0.6444747 0.6468064)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.59553725"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 2  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 106.89172 0.035760004 -0.05016 -0.022799999 4.9816008 5.0695014);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.1421334E-4 -2.0827129E-4 9.331154E-5 0.99742306 3.3368208E-4 -4.6805062E-4 -2.1275028E-4 0.04648408 0.04730429)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 107.16789 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 7.6876564 0.011000001 0.011000001 0.011000001 4.8788304 4.8844476) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.99742306 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 6.690233 0.010000001 0.010000001 0.010000001 4.8778305 4.8834477)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010604807 0.0010604807 0.0010604807 0.74114645 0.0010604807 0.0010604807 0.0010604807 0.47035503 0.47089657), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.332655"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.74114645 0.001 0.001 0.001 0.47035503 0.47089657), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.74114645 0.001 0.001 0.001 0.47035503 0.47089657)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.64987E-4 9.64987E-4 9.64987E-4 0.7151966 9.64987E-4 9.64987E-4 9.64987E-4 0.45388645 0.45440903),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0362835"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 2 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 6.3101826 0.011000001 0.011000001 0.011000001 6.5944858 6.0209303)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 5.566521  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.974361 after w loop:
; L2norm-xi-1-2= 10.934361 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010023363 0.0010023363 0.0010023363 0.57499314 0.0010023363 0.0010023363 0.0010023363 0.6008993 0.5486361)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.974361 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011544903 0.0011544903 0.0011544903 0.56263084 0.0011544903 0.0011544903 0.0011544903 0.6093839 0.5586302)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.528015"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.35794538 0.35815617 0.35836798 0.3586428),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.36109954 0.3785891 0.37743098 0.9220636 0.3620251 0.37733737 0.37518418 0.98594177 0.91727305)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.3586428"
 "
Step 5: FIND yi-3-2-vals= (0.18912007 0.19827993 0.1976734 0.48291594 0.18960482 0.19762437 0.19649667 0.51637114 0.48040697), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.9093666"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 5.4041524 0.011000001 0.011000001 0.011000001 5.764611 5.3527055)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 4.8291593 0.010000001 0.010000001 0.010000001 5.1637116 4.8040695)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.99742306  max2yI-1-2-val= 0.6008993
"
 "
Step 1.2: FIND  ri-1-2-vals= (-8.580503E-4 -8.580503E-4 -8.580503E-4 -0.1932534 -8.580503E-4 -8.580503E-4 -8.580503E-4 -0.5425496 -0.4575438)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.99742306,  yi-1-2  max2yi-1-2-val= 0.6008993
 WHERE yi-1-1-vals= (0.0010604807 0.0010604807 0.0010604807 0.74114645 0.0010604807 0.0010604807 0.0010604807 0.47035503 0.47089657)
         and yi-1-2-vals= (0.0011544903 0.0011544903 0.0011544903 0.56263084 0.0011544903 0.0011544903 0.0011544903 0.6093839 0.5586302)"
 "==>>RESET: All F1,F2 LAYER 1 X and Y nodes RESET"
 "==>>RESET: All F1,F2 LAYER 2 X and Y nodes RESET"
 "==>>RESET: MAX F3 X and Ys in  LAYER 2 X and Y nodes. *reset-all-F3Layer-maxs-p= T"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 2; *tdelta-cycle-n= 1
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0397759  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.9996856 (at F3y-max-index= 2)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0397759;  initial was-reset-p= T; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 1.2507482, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.7357342;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= T, res= 1.2507482  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (0 0 0 0 0 0 0 1.2507482 0)>>> resetnouti-2-2-vals= (0 1.2507482 0 0 0)
  *my-reset-broadcast= T    max-Index 2
  *skip-reset= NIL  updated was-reset-p= T 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 999 0.01 0.01 0.01)
                  and xi-2-3-vals= (999 1.1805544 1.1805544 1.1805544 1.1805544)
                and xi-3-3-vals= (0.0010001 999 0.0010001 0.0010001 0.0010001); max-xi-1-3= 2 max-xi-2-3= 1 max-xi-3-3= 2
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 999 0.01 0.01 0.01)
                  and yi-2-3-vals= (999 0.44719344 0.44719344 0.44719344 0.44719344)
                and yi-3-3-vals= (0.0016785144 999 0.0016785144 0.0016785144 0.0016785144)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 13; *pattern-cycle-n= 2 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1930348 1.1759849 1.1794663 1.1782651) 
FOR  resetnout-vals= (0 999 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.094238535 0.17543417 0.26288489 0.45634103 0.54071516 0.6394483 0.73121226 0.98144567 1.1782204);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (1.0E-7 4.471934E-5 4.471934E-5 4.471934E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 1.1930348;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (1.1930348 0.01 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 999 0.0010001 0.0010001 0.0010001)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 999 0.0010001 0.0010001 0.0010001)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0016785144;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.0016785144 999 0.0016785144 0.0016785144 0.0016785144)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.2333443 after w loop:
; L2norm-xI-1-3= 1.1933444
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.9997406 0.0083798105 0.0083798105 0.0083798105 0.0083798105);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.2333443 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 1.1930348;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (1.1930348 0.01 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.9997406;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.9997406 0.01 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.1782205 1.1782651 1.1782651 1.1782651 1.1782651)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44717988 0.4471968 0.4471968 0.4471968 0.4471968);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.1782205 1.1782651 1.1782651 1.1782651 1.1782651)
 L2norm-xI-2-3= 2.6347797
 "
 "
STEP 5: FIND xI-3-3-vals= (0.9997407 0.0010001 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.99984795 0.0010002073 0.0010002073 0.0010002073 0.0010002073);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.9997407 0.0010001 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.9998928
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 2  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 99.96888 0.035760004 -0.05016 -0.022799999 -0.06312 0.018960003);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.2238897E-4 -2.2317979E-4 9.9990975E-5 0.9995985 3.5756774E-4 -5.015547E-4 -2.2797939E-4 -6.31143E-4 1.895829E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 100.00903 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 8.151565 0.011000001 0.011000001 0.011000001 4.5398646 4.54509) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.9995985 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 7.151966 0.010000001 0.010000001 0.010000001 4.5388646 4.5440903)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010557857 0.0010557857 0.0010557857 0.7823913 0.0010557857 0.0010557857 0.0010557857 0.4357385 0.43624005), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.378782"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.7823913 0.001 0.001 0.001 0.4357385 0.43624005), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.7823913 0.001 0.001 0.001 0.4357385 0.43624005)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.6497097E-4 9.6497097E-4 9.6497097E-4 0.75498486 9.6497097E-4 9.6497097E-4 9.6497097E-4 0.42047498 0.42095897),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363007"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 2 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.76498485 0.011000001 0.011000001 0.011000001 0.43047497 0.43095896)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0183956 after w loop:
; L2norm-xi-1-2= 0.9783955 "
 "
Step 3: FIND yi-1-2-vals=  (0.010801305 0.010801305 0.010801305 0.7511667 0.010801305 0.010801305 0.010801305 0.42269918 0.42317444)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0183956 "
 "
Step 4.2: FIND yi-2-2-vals=(0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.031722777"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.2748)
 wdn-vals= 5 *n-outputs= (For i=  9 0.12012001 0.12071625 0.12092705 0.12113885 0.12141365),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.6 0.001 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.44922435 0.4538642 0.4661218 0.5198009 0.4761771 0.45241272 0.55249006 0.5383886 0.43664455)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.12141365"
 "
Step 5: FIND yi-3-2-vals= (0.30077425 0.3038808 0.3120878 0.34802818 0.31882024 0.30290902 0.36991492 0.36047342 0.29235157), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.4935598"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 0.7611667 0.011000001 0.011000001 0.011000001 0.43269917 0.43317443)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.9995985  max2yI-1-2-val= 0.7511667
"
 "
Step 1.2: FIND  ri-1-2-vals= (-0.41859883 -0.41859883 -0.41859883 0.3630505 -0.41859883 -0.41859883 -0.41859883 0.016258479 0.0167602)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.9995985,  yi-1-2  max2yi-1-2-val= 0.7511667
 WHERE yi-1-1-vals= (0.0010557857 0.0010557857 0.0010557857 0.7823913 0.0010557857 0.0010557857 0.0010557857 0.4357385 0.43624005)
         and yi-1-2-vals= (0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)"
 "==>>RESET: All F1,F2 LAYER 1 X and Y nodes RESET"
 "==>>RESET: All F1,F2 LAYER 2 X and Y nodes RESET"
 "==>>RESET: MAX F3 X and Ys in  LAYER 2 X and Y nodes. *reset-all-F3Layer-maxs-p= T"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 2; *tdelta-cycle-n= 2
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.039749  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.99984795 (at F3y-max-index= 1)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.039749;  initial was-reset-p= T; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 1.8498144, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 1.0881261;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= T, res= 1.8498144  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (1.8498144 0 0 0 0 0 0 1.2507482 0)>>> resetnouti-2-2-vals= (1.8498144 1.2507482 0 0 0)
  *my-reset-broadcast= T    max-Index 1
  *skip-reset= NIL  updated was-reset-p= T 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (999 0.01 0.01 0.01 0.01)
                  and xi-2-3-vals= (1.1782205 999 1.1782651 1.1782651 1.1782651)
                and xi-3-3-vals= (999 0.0010001 0.0010001 0.0010001 0.0010001); max-xi-1-3= 1 max-xi-2-3= 2 max-xi-3-3= 1
"
 "AFTER RESET Y:  yi-1-3-vals= (999 0.01 0.01 0.01 0.01)
                  and yi-2-3-vals= (0.44717988 999 0.4471968 0.4471968 0.4471968)
                and yi-3-3-vals= (999 0.0010002073 0.0010002073 0.0010002073 0.0010002073)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 14; *pattern-cycle-n= 2 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.8796826 1.2890209 1.3093203 1.3122386) 
FOR  resetnout-vals= (999 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.1498758 0.274315 0.41238266 0.55180276 0.6936778 0.8450111 1.0177614 1.1924467 1.3121939);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (1.0E-7 4.471968E-5 4.471968E-5 4.471968E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.3122386;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.3122386)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (999 0.0010001 0.0010001 0.0010001 0.0010001)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (999 0.0010001 0.0010001 0.0010001 0.0010001)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.0010002073;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (999 0.0010002073 0.0010002073 0.0010002073 0.0010002073)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.352529 after w loop:
; L2norm-xI-1-3= 1.3125291
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.0076188785 0.0076188785 0.0076188785 0.0076188785 0.9997787);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.352529 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.3122386;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.3122386)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.9997787;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.9997787)
"
 "
STEP 3: FIND xi-2-3-vals= (1.3122386 1.312194 1.3122386 1.3122386 1.3122386)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719884 0.44718364 0.44719884 0.44719884 0.44719884);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.3122386 1.312194 1.3122386 1.3122386 1.3122386)
 L2norm-xI-2-3= 2.9343515
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.9997788),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010001692 0.0010001692 0.0010001692 0.0010001692 0.99984795);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.9997788)
 L2norm-xI-3-3= 0.99993086
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 5 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=5  wdn-vals= (0.5015389 0.4421069 0.5320909 0.4763069 0.5322429 0.4986509 0.4463629 0.51795495 0.4487949)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997787"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=5  wup-vals= (0.6186549 0.5511669 0.5761709 0.5444029 0.5781469 0.61964286 0.5948669 0.60824287 0.5512429)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997787"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 3  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 99.96888 0.035760004 -0.05016 -0.022799999 -0.06312 0.018960003);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.2238897E-4 -2.2317979E-4 9.9990975E-5 0.9995985 3.5756774E-4 -5.015547E-4 -2.2797939E-4 -6.31143E-4 1.895829E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 100.00903 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 8.549447 0.011000001 0.011000001 0.011000001 4.2057495 4.2105894) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.9995985 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 7.5498486 0.010000001 0.010000001 0.010000001 4.2047496 4.2095895)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010519296 0.0010519296 0.0010519296 0.8175832 0.0010519296 0.0010519296 0.0010519296 0.40219563 0.40265846), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.416975"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.8175832 0.001 0.001 0.001 0.40219563 0.40265846), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.8175832 0.001 0.001 0.001 0.40219563 0.40265846)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.64958E-4 9.64958E-4 9.64958E-4 0.7889334 9.64958E-4 9.64958E-4 9.64958E-4 0.38810188 0.38854846),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363146"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 3 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.7989334 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 0.83970154 after w loop:
; L2norm-xi-1-2= 0.7997015 "
 "
Step 3: FIND yi-1-2-vals=  (0.013099894 0.013099894 0.013099894 0.9514492 0.013099894 0.013099894 0.013099894 0.013099894 0.013099894)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 0.83970154 "
 "
Step 4.2: FIND yi-2-2-vals=(0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.031722777"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.4487949)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.96442E-4 0.001007242 0.001219042 0.27049598),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.6175443 0.58193094 0.6359607 0.60257245 0.6360438 0.61600864 0.5846292 0.6275252 0.58572686)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.27049598"
 "
Step 5: FIND yi-3-2-vals= (0.33015156 0.31111193 0.33999732 0.3221473 0.34004176 0.32933056 0.31255448 0.33548754 0.31314132), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.8704873"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 0.9614492 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 15; *pattern-cycle-n= 3 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.3156027 1.895212 1.3039254 1.3215699 1.7103083) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.20424989 0.3757245 0.57162107 0.746999 0.9435931 1.1476604 1.3335887 1.5376467 1.7102636);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719884E-5 4.4718363E-5 4.4719884E-5 4.4719884E-5 4.4719884E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  3.4598458 after w loop:
; L2norm-xI-1-3= 3.4198459
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.38469648 0.55418057 0.3812819 0.38644138 0.5001127);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 3.4598458 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.7103083;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.7103083)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.5001127;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.5001127)
"
 "
STEP 3: FIND xi-2-3-vals= (1.7103083 1.7103083 1.7103083 1.7103083 1.7103083)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4472004 0.4472004 0.4472004 0.4472004 0.4472004);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.7103083 1.7103083 1.7103083 1.7103083 1.7103083)
 L2norm-xI-2-3= 3.8244787
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.50021267),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0019985347 0.0019985347 0.0019985347 0.0019985347 0.9995924);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.50021267)
 L2norm-xI-3-3= 0.50041664
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 3  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 108.13471 0.035760004 -0.05016 -0.022799999 3.9488364 4.0355444);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.1299631E-4 -2.06052E-4 9.2317234E-5 0.9982697 3.3012644E-4 -4.630632E-4 -2.1048327E-4 0.036454562 0.037255027)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 108.32214 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 8.887604 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.9982697 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 7.8893337 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0012321114 0.0012321114 0.0012321114 0.9955015 0.0012321114 0.0012321114 0.0012321114 0.0012321114 0.0012321114), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 8.887765"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.9955015 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.9955015 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.655718E-4 9.655718E-4 9.655718E-4 0.96122814 9.655718E-4 9.655718E-4 9.655718E-4 9.655718E-4 9.655718E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0356559"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 3 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.9712281 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0118778 after w loop:
; L2norm-xi-1-2= 0.9718778 "
 "
Step 3: FIND yi-1-2-vals=  (0.010870879 0.010870879 0.010870879 0.9598275 0.010870879 0.010870879 0.010870879 0.010870879 0.010870879)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0118778 "
 "
Step 4.2: FIND yi-2-2-vals=(0.011433271 0.011433271 0.011433271 0.9993189 0.011433271 0.011433271 0.011433271 0.011433271 0.011433271)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.9621045"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.4487949)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.96442E-4 0.001007242 0.001219042 0.27049598),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.31374663 0.2781333 0.3321631 1.2866604 0.33224618 0.31221104 0.28083158 0.32372755 0.28192925)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.27049598"
 "
Step 5: FIND yi-3-2-vals= (0.19690408 0.17455353 0.20846206 0.8074945 0.2085142 0.19594036 0.17624694 0.20316799 0.17693582), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.5933983"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 9.034773 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 8.074945 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 16; *pattern-cycle-n= 3 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0502403 1.5165802 1.0380458 1.0315319 1.3456991) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.121815674 0.2180238 0.33813357 0.77773595 0.8982878 1.0197008 1.1245443 1.2481197 1.3456544);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4720037E-5 4.4720037E-5 4.4720037E-5 4.4720037E-5 4.4720037E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.7522252 after w loop:
; L2norm-xI-1-3= 2.7122252
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.38722458 0.5591646 0.38272846 0.3803268 0.49616054);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.7522252 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.3456991;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.3456991)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.49616054;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.49616054)
"
 "
STEP 3: FIND xi-2-3-vals= (1.3456991 1.3456991 1.3456991 1.3456991 1.3456991)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719625 0.44719625 0.44719625 0.44719625 0.44719625);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.3456991 1.3456991 1.3456991 1.3456991 1.3456991)
 L2norm-xI-2-3= 3.0091913
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.4962605),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0020144412 0.0020144412 0.0020144412 0.0020144412 0.9995876);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.4962605)
 L2norm-xI-3-3= 0.49646524
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 5 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=5  wdn-vals= (0.5002481 0.45507976 0.5234676 0.48107177 0.5235831 0.49805322 0.45831433 0.5127243 0.46016264)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.49616054"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=5  wup-vals= (0.5892563 0.53796536 0.55696846 0.53282476 0.55847013 0.59000707 0.57117737 0.5813431 0.5380231)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.49616054"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 4  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 109.913895 0.035760004 -0.05016 -0.022799999 -0.06312 0.018960003);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.1131926E-4 -2.0299386E-4 9.09471E-5 0.99963487 3.2522684E-4 -4.5619058E-4 -2.0735935E-4 -5.7405804E-4 1.7243572E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 109.95404 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.611917 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.99963487 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.612282 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010326635 0.0010326635 0.0010326635 0.9962307 0.0010326635 0.0010326635 0.0010326635 0.0010326635 0.0010326635), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.612067"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.9962307 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.9962307 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648925E-4 9.648925E-4 9.648925E-4 0.9612555 9.648925E-4 9.648925E-4 9.648925E-4 9.648925E-4 9.648925E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0363849"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 4 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.954444 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.994593 after w loop:
; L2norm-xi-1-2= 10.954593 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010004919 0.0010004919 0.0010004919 0.9963483 0.0010004919 0.0010004919 0.0010004919 0.0010004919 0.0010004919)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.994593 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0012174968 0.0012174968 0.0012174968 0.99998236 0.0012174968 0.0012174968 0.0012174968 0.0012174968 0.0012174968)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.034932"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.46016264)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.96442E-4 0.001007242 0.001219042 0.27731663),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.30275634 0.27570122 0.31677333 1.2901828 0.31683454 0.30163664 0.27778664 0.31037337 0.2785341)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.27731663"
 "
Step 5: FIND yi-3-2-vals= (0.19146672 0.17435675 0.20033124 0.815927 0.20036996 0.19075862 0.17567559 0.19628382 0.1761483), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.5812478"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 9.155619 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 8.15927 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.99963487  max2yI-1-2-val= 0.9963483
"
 "
Step 1.2: FIND  ri-1-2-vals= (-1.8891832E-4 -1.8891832E-4 -1.8891832E-4 -0.0070527196 -1.8891832E-4 -1.8891832E-4 -1.8891832E-4 -1.8891832E-4 -1.8891832E-4)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.99963487,  yi-1-2  max2yi-1-2-val= 0.9963483
 WHERE yi-1-1-vals= (0.0010326635 0.0010326635 0.0010326635 0.9962307 0.0010326635 0.0010326635 0.0010326635 0.0010326635 0.0010326635)
         and yi-1-2-vals= (0.0012174968 0.0012174968 0.0012174968 0.99998236 0.0012174968 0.0012174968 0.0012174968 0.0012174968 0.0012174968)"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 4; *tdelta-cycle-n= 1
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0397853  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.9995876 (at F3y-max-index= 5)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0397853;  initial was-reset-p= NIL; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 0.020992496, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.012348526;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= NIL, res= 0.020992496  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (1.8498144 0 0 0 0 0 0 1.2507482 0)>>> resetnouti-2-2-vals= NIL
  *my-reset-broadcast= NIL    max-Index 5
  *skip-reset= NIL  updated was-reset-p= NIL 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 0.01 0.01 0.01 1.3456991)
                  and xi-2-3-vals= (1.3456991 1.3456991 1.3456991 1.3456991 1.3456991)
                and xi-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.4962605); max-xi-1-3= NIL max-xi-2-3= NIL max-xi-3-3= NIL
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.01 0.01 0.01 0.49616054)
                  and yi-2-3-vals= (0.44719625 0.44719625 0.44719625 0.44719625 0.44719625)
                and yi-3-3-vals= (0.0020144412 0.0020144412 0.0020144412 0.0020144412 0.9995876)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 17; *pattern-cycle-n= 4 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0378971 1.4992257 1.0262077 1.0185322 1.2866614) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.112822965 0.20662084 0.31819904 0.7529452 0.8648458 0.97739476 1.0777366 1.1918448 1.2866167);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471962E-5 4.471962E-5 4.471962E-5 4.471962E-5 4.471962E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.2866614;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.2866614)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.4962605;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.01 0.01 0.01 0.4962605)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.4962605;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.01 0.01 0.01 0.4962605)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.9995876;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.01 0.01 0.01 0.01 0.9995876)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.3269557 after w loop:
; L2norm-xI-1-3= 1.2869557
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.0077702748 0.0077702748 0.0077702748 0.0077702748 0.9997713);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.3269557 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.2866614;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.2866614)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.9997713;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.9997713)
"
 "
STEP 3: FIND xi-2-3-vals= (1.2866614 1.2866614 1.2866614 1.2866614 1.2866614)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719535 0.44719535 0.44719535 0.44719535 0.44719535);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.2866614 1.2866614 1.2866614 1.2866614 1.2866614)
 L2norm-xI-2-3= 2.8771797
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.99987126),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010000768 0.0010000768 0.0010000768 0.0010000768 0.999848);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.99987126)
 L2norm-xI-3-3= 1.0000233
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 4  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 109.92119 0.035760004 -0.05016 -0.022799999 -0.06312 0.018960003);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.1131188E-4 -2.0298039E-4 9.094107E-5 0.9996349 3.2520527E-4 -4.5616034E-4 -2.073456E-4 -5.7401997E-4 1.7242428E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 109.961335 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.612189 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.9996349 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.612555 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010326371 0.0010326371 0.0010326371 0.99623085 0.0010326371 0.0010326371 0.0010326371 0.0010326371 0.0010326371), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.61234"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.99623085 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.99623085 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648924E-4 9.648924E-4 9.648924E-4 0.9612555 9.648924E-4 9.648924E-4 9.648924E-4 9.648924E-4 9.648924E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.036385"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 4 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.961079 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 11.001228 after w loop:
; L2norm-xi-1-2= 10.961228 "
 "
Step 3: FIND yi-1-2-vals=  (9.998884E-4 9.998884E-4 9.998884E-4 0.9963504 9.998884E-4 9.998884E-4 9.998884E-4 9.998884E-4 9.998884E-4)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 11.001228 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0012014272 0.0012014272 0.0012014272 0.9999826 0.0012014272 0.0012014272 0.0012014272 0.0012014272 0.0012014272)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.155778"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.46016264)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.96442E-4 0.001007242 0.001219042 0.27731663),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.30274028 0.27568516 0.31675726 1.2901831 0.31681848 0.30162057 0.27777058 0.3103573 0.27851805)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.27731663"
 "
Step 5: FIND yi-3-2-vals= (0.19145954 0.1743493 0.2003242 0.81593985 0.2003629 0.19075142 0.17566817 0.19627671 0.17614088), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.5812233"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 9.155748 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 8.159398 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.9996349  max2yI-1-2-val= 0.9963504
"
 "
Step 1.2: FIND  ri-1-2-vals= (-1.7281366E-4 -1.7281366E-4 -1.7281366E-4 -0.007050872 -1.7281366E-4 -1.7281366E-4 -1.7281366E-4 -1.7281366E-4 -1.7281366E-4)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.9996349,  yi-1-2  max2yi-1-2-val= 0.9963504
 WHERE yi-1-1-vals= (0.0010326371 0.0010326371 0.0010326371 0.99623085 0.0010326371 0.0010326371 0.0010326371 0.0010326371 0.0010326371)
         and yi-1-2-vals= (0.0012014272 0.0012014272 0.0012014272 0.9999826 0.0012014272 0.0012014272 0.0012014272 0.0012014272 0.0012014272)"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 4; *tdelta-cycle-n= 2
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0397854  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.999848 (at F3y-max-index= 5)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0397854;  initial was-reset-p= NIL; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 0.02098745, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.012345558;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= NIL, res= 0.02098745  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (1.8498144 0 0 0 0 0 0 1.2507482 0)>>> resetnouti-2-2-vals= NIL
  *my-reset-broadcast= NIL    max-Index 5
  *skip-reset= NIL  updated was-reset-p= NIL 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 0.01 0.01 0.01 1.2866614)
                  and xi-2-3-vals= (1.2866614 1.2866614 1.2866614 1.2866614 1.2866614)
                and xi-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.99987126); max-xi-1-3= NIL max-xi-2-3= NIL max-xi-3-3= NIL
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.01 0.01 0.01 0.9997713)
                  and yi-2-3-vals= (0.44719535 0.44719535 0.44719535 0.44719535 0.44719535)
                and yi-3-3-vals= (0.0010000768 0.0010000768 0.0010000768 0.0010000768 0.999848)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 18; *pattern-cycle-n= 4 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0378769 1.4991969 1.0261874 1.0185109 1.2866355) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.11281873 0.20661262 0.31818688 0.7529398 0.8648365 0.9773812 1.0777189 1.191823 1.2865908);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719535E-5 4.4719535E-5 4.4719535E-5 4.4719535E-5 4.4719535E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.2866355;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.2866355)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.99987126;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.01 0.01 0.01 0.99987126)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.99987126;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.01 0.01 0.01 0.01 0.99987126)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.999848;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.01 0.01 0.01 0.01 0.999848)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.3269298 after w loop:
; L2norm-xI-1-3= 1.2869299
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.007770431 0.007770431 0.007770431 0.007770431 0.9997713);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.3269298 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.2866355;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.2866355)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.9997713;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.9997713)
"
 "
STEP 3: FIND xi-2-3-vals= (1.2866355 1.2866355 1.2866355 1.2866355 1.2866355)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719538 0.44719538 0.44719538 0.44719538 0.44719538);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.2866355 1.2866355 1.2866355 1.2866355 1.2866355)
 L2norm-xI-2-3= 2.8771217
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.99987126),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010000768 0.0010000768 0.0010000768 0.0010000768 0.999848);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.99987126)
 L2norm-xI-3-3= 1.0000233
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 5 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=5  wdn-vals= (0.62013364 0.5858058 0.6377805 0.60555965 0.6378683 0.61846555 0.588264 0.62961555 0.58966876)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997713"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=5  wup-vals= (0.6877799 0.64879877 0.66324115 0.6448919 0.6643824 0.6883505 0.6740399 0.6817659 0.6488427)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997713"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 5  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 109.92119 0.035760004 -0.05016 -0.022799999 -0.06312 0.018960003);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.1131188E-4 -2.0298039E-4 9.094107E-5 0.9996349 3.2520527E-4 -4.5616034E-4 -2.073456E-4 -5.7401997E-4 1.7242428E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 109.961335 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.612189 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.9996349 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.612555 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010326371 0.0010326371 0.0010326371 0.99623085 0.0010326371 0.0010326371 0.0010326371 0.0010326371 0.0010326371), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.61234"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.99623085 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.99623085 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648924E-4 9.648924E-4 9.648924E-4 0.9612555 9.648924E-4 9.648924E-4 9.648924E-4 9.648924E-4 9.648924E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.036385"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 5 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.9610815 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 11.001231 after w loop:
; L2norm-xi-1-2= 10.961231 "
 "
Step 3: FIND yi-1-2-vals=  (9.998882E-4 9.998882E-4 9.998882E-4 0.9963504 9.998882E-4 9.998882E-4 9.998882E-4 9.998882E-4 9.998882E-4)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 11.001231 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0012014102 0.0012014102 0.0012014102 0.9999826 0.0012014102 0.0012014102 0.0012014102 0.0012014102 0.0012014102)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.155908"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.58966876)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.96442E-4 0.001007242 0.001219042 0.35502028),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.37467164 0.35412076 0.385345 1.3648758 0.38538957 0.37386796 0.35574037 0.38049206 0.3562217)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.35502028"
 "
Step 5: FIND yi-3-2-vals= (0.21268067 0.20101506 0.21873936 0.7747656 0.21876467 0.21222447 0.20193443 0.21598462 0.20220766), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.7616629"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 8.744006 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 7.747656 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 19; *pattern-cycle-n= 5 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0993617 1.5877775 1.0879116 1.0825524 1.6274495) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.14627749 0.2766958 0.42177272 0.9214128 1.0667563 1.212841 1.3489529 1.4962039 1.6274048);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719538E-5 4.4719538E-5 4.4719538E-5 4.4719538E-5 4.4719538E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.9953997 after w loop:
; L2norm-xI-1-3= 2.9553998
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.3719841 0.5372463 0.3681098 0.36629644 0.55066985);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.9953997 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.6274495;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.6274495)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.55066985;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.55066985)
"
 "
STEP 3: FIND xi-2-3-vals= (1.6274495 1.6274495 1.6274495 1.6274495 1.6274495)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4471996 0.4471996 0.4471996 0.4471996 0.4471996);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.6274495 1.6274495 1.6274495 1.6274495 1.6274495)
 L2norm-xI-2-3= 3.6392014
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.5507698),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0018151815 0.0018151815 0.0018151815 0.0018151815 0.9996471);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.5507698)
 L2norm-xI-3-3= 0.55096424
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 5  *n-pattern-cycles= 5;
 INPUT-VALS= (0.0022400022 -0.032319997 0.0 99.95888 0.025760003 -0.06016 -0.0328 -0.07312 0.008960001)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (0.012240003 -0.022319995 0.010000001 109.92119 0.035760004 -0.05016 -0.022799999 -0.06312 0.018960003);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (1.1131188E-4 -2.0298039E-4 9.094107E-5 0.9996349 3.2520527E-4 -4.5616034E-4 -2.073456E-4 -5.7401997E-4 1.7242428E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 109.961335 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.612189 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.9996349 0.001 0.001 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.612555 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010326371 0.0010326371 0.0010326371 0.99623085 0.0010326371 0.0010326371 0.0010326371 0.0010326371 0.0010326371), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.61234"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.99623085 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.99623085 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.648924E-4 9.648924E-4 9.648924E-4 0.9612555 9.648924E-4 9.648924E-4 9.648924E-4 9.648924E-4 9.648924E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.036385"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 5 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.9610815 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 11.001231 after w loop:
; L2norm-xi-1-2= 10.961231 "
 "
Step 3: FIND yi-1-2-vals=  (9.998882E-4 9.998882E-4 9.998882E-4 0.9963504 9.998882E-4 9.998882E-4 9.998882E-4 9.998882E-4 9.998882E-4)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 11.001231 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0012579815 0.0012579815 0.0012579815 0.9999816 0.0012579815 0.0012579815 0.0012579815 0.0012579815 0.0012579815)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 8.744167"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.58966876)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.96442E-4 0.001007242 0.001219042 0.35502028),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.3747282 0.35417733 0.38540158 1.3648747 0.38544613 0.37392452 0.35579693 0.38054863 0.35627827)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.35502028"
 "
Step 5: FIND yi-3-2-vals= (0.21270111 0.20103614 0.21875946 0.7747225 0.21878477 0.21224493 0.20195546 0.21600487 0.20222867), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.7617595"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 8.743576 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 7.7472253 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 20; *pattern-cycle-n= 5 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0994164 1.5878558 1.0879662 1.0826097 1.6275319) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.14629156 0.27672356 0.42181385 0.9214262 1.066783 1.2128818 1.3490079 1.4962726 1.6274872);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471996E-5 4.471996E-5 4.471996E-5 4.471996E-5 4.471996E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.9955485 after w loop:
; L2norm-xI-1-3= 2.9555486
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.37198386 0.53724576 0.36810973 0.36629736 0.55066997);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.9955485 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.6275319;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.6275319)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.55066997;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.55066997)
"
 "
STEP 3: FIND xi-2-3-vals= (1.6275319 1.6275319 1.6275319 1.6275319 1.6275319)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719964 0.44719964 0.44719964 0.44719964 0.44719964);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.6275319 1.6275319 1.6275319 1.6275319 1.6275319)
 L2norm-xI-2-3= 3.6393855
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.5507699),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.001815181 0.001815181 0.001815181 0.001815181 0.9996471);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.5507699)
 L2norm-xI-3-3= 0.55096436
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 5 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=5  wdn-vals= (0.60346234 0.5773732 0.616874 0.5923861 0.6169407 0.6021946 0.5792414 0.6106686 0.58030904)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.55066997"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=5  wup-vals= (0.6548735 0.62524784 0.6362241 0.62227864 0.6370914 0.6553072 0.6444311 0.6503029 0.6252812)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.55066997"
 "
==>> END UPDATE WEIGHTS ==========
"
 "

 =========>> NEW INPUT PATTERN =====================
   INPUT PATTERN= ((0 0 0 100 100 100 0 0 0) Xbig)   *pattern-n= 3
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 1  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 110.01799 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7275449E-4 3.0756553E-4 -5.0442505E-5 0.6138922 0.5580091 0.55795557 2.7453236E-4 3.3479555E-5 4.3791256E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 179.21385 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.226447 0.5680091 0.56795556 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.6138922 0.5580091 0.55795557 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.612555 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010681598 0.0010681598 0.0010681598 0.99304355 0.055156768 0.055151567 0.0010681598 0.0010681598 0.0010681598), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.258085"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.99304355 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.99304355 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.678687E-4 9.678687E-4 9.678687E-4 0.96113575 9.678687E-4 9.678687E-4 9.678687E-4 9.678687E-4 9.678687E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.033198"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 1 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.960952 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 11.001101 after w loop:
; L2norm-xi-1-2= 10.961101 "
 "
Step 3: FIND yi-1-2-vals=  (9.999E-4 9.999E-4 9.999E-4 0.99635047 9.999E-4 9.999E-4 9.999E-4 9.999E-4 9.999E-4)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 11.001101 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0012580433 0.0012580433 0.0012580433 0.9999816 0.0012580433 0.0012580433 0.0012580433 0.0012580433 0.0012580433)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 8.743737"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.96442E-4 0.001007242 0.001219042 0.34940445),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.36472547 0.34911785 0.37285772 1.3569706 0.37288964 0.36416203 0.35038343 0.3691805 0.3506625)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.34940445"
 "
Step 5: FIND yi-3-2-vals= (0.20963264 0.20066187 0.21430679 0.77994365 0.21432513 0.20930879 0.20138929 0.21219324 0.20154968), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.7398316"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 8.795787 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 7.7994366 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 21; *pattern-cycle-n= 1 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.092484 1.5780958 1.0812937 1.0752932 1.5519831) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.13728285 0.26274624 0.3990934 0.88443566 1.0209804 1.1581419 1.2879233 1.4259132 1.5519384);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719964E-5 4.4719964E-5 4.4719964E-5 4.4719964E-5 4.4719964E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.941498 after w loop:
; L2norm-xI-1-3= 2.901498
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.37652412 0.54389 0.37266737 0.3705993 0.5348903);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.941498 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.5780958;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.5780958 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.54389;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.54389 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.5519831 1.5519831 1.5519831 1.5519831 1.5519831)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719887 0.44719887 0.44719887 0.44719887 0.44719887);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.5519831 1.5519831 1.5519831 1.5519831 1.5519831)
 L2norm-xI-2-3= 3.470454
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.5438901 0.0010001 0.0010001 0.0010999647),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0018381287 0.99964005 0.0018381287 0.0018381287 0.0020216746);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.5438901 0.0010001 0.0010001 0.0010999647)
 L2norm-xI-3-3= 0.544086
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 1  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 109.986115 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7277335E-4 3.075991E-4 -5.044801E-5 0.61378134 0.55807 0.5580165 2.7456234E-4 3.348321E-5 4.3796038E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 179.19429 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.225139 0.56807 0.56801647 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.61378134 0.55807 0.5580165 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611358 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010682945 0.0010682945 0.0010682945 0.99304164 0.055169635 0.055164438 0.0010682945 0.0010682945 0.0010682945), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.256787"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.99304164 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.99304164 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.678705E-4 9.678705E-4 9.678705E-4 0.9611357 9.678705E-4 9.678705E-4 9.678705E-4 9.678705E-4 9.678705E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0331961"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 1 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.960952 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 11.001101 after w loop:
; L2norm-xi-1-2= 10.961101 "
 "
Step 3: FIND yi-1-2-vals=  (9.999E-4 9.999E-4 9.999E-4 0.99635047 9.999E-4 9.999E-4 9.999E-4 9.999E-4 9.999E-4)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 11.001101 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0012505759 0.0012505759 0.0012505759 0.9999817 0.0012505759 0.0012505759 0.0012505759 0.0012505759 0.0012505759)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 8.795948"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.59624196 0.2108 0.21180001 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.35794538 0.35815617 0.35836798 0.3589483),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.3614549 0.37899655 0.37775955 1.3596959 0.36235353 0.37769523 0.3755879 0.3780533 0.36019886)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.3589483"
 "
Step 5: FIND yi-3-2-vals= (0.20552512 0.21549939 0.214796 0.77313006 0.20603608 0.21475944 0.2135612 0.21496305 0.20481092), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.7586898"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 8.727651 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 7.7313004 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 22; *pattern-cycle-n= 1 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.1010918 1.5908868 1.090696 1.0847541 1.564617) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.13459295 0.26933348 0.40599188 0.8870942 1.018358 1.1590914 1.2967168 1.4365079 1.5645723);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4719888E-5 4.4719888E-5 4.4719888E-5 4.4719888E-5 4.4719888E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.9654646 after w loop:
; L2norm-xI-1-3= 2.9254647
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.37638184 0.54380656 0.3728283 0.37079722 0.5348269);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.9654646 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 1.5908868;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 1.5908868 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 2 y-max-value 0.54380656;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.54380656 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.564617 1.564617 1.564617 1.564617 1.564617)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719902 0.44719902 0.44719902 0.44719902 0.44719902);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.564617 1.564617 1.564617 1.564617 1.564617)
 L2norm-xI-2-3= 3.4987042
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.5439065 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.001838074 0.99964035 0.001838074 0.001838074 0.001838074);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.5439065 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.5441022
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 2 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=2  wdn-vals= (0.5850048 0.6072362 0.6055666 0.58418465 0.58602995 0.60536165 0.6027255 0.60588885 0.58365745)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.54380656"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=2  wup-vals= (0.62117845 0.62221826 0.6228334 0.6211638 0.6233752 0.61350435 0.6264214 0.62031436 0.62208647)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.54380656"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 2  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 109.9861 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7277336E-4 3.0759914E-4 -5.0448013E-5 0.61378134 0.55807007 0.5580165 2.7456236E-4 3.348321E-5 4.379604E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 179.19428 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.225138 0.56807006 0.56801647 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.61378134 0.55807007 0.5580165 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611357 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010682945 0.0010682945 0.0010682945 0.99304164 0.055169646 0.05516444 0.0010682945 0.0010682945 0.0010682945), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.256786"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.99304164 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.99304164 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.678705E-4 9.678705E-4 9.678705E-4 0.9611357 9.678705E-4 9.678705E-4 9.678705E-4 9.678705E-4 9.678705E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0331961"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 2 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.960953 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 11.001102 after w loop:
; L2norm-xi-1-2= 10.9611025 "
 "
Step 3: FIND yi-1-2-vals=  (9.998998E-4 9.998998E-4 9.998998E-4 0.9963504 9.998998E-4 9.998998E-4 9.998998E-4 9.998998E-4 9.998998E-4)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 11.001102 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0012603389 0.0012603389 0.0012603389 0.9999815 0.0012603389 0.0012603389 0.0012603389 0.0012603389 0.0012603389)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 8.727812"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.2108 0.21180001 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 0.3503947 0.3506055 0.3508173 0.3513976),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.6 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.3536587 0.36698806 0.3660674 1.352045 0.35436308 0.36604193 0.36443412 0.36630014 0.35265794)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.3513976"
 "
Step 5: FIND yi-3-2-vals= (0.20383387 0.21151634 0.21098572 0.77926136 0.20423983 0.21097103 0.21004436 0.21111985 0.20325707), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.7350341"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 8.788964 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 7.7926135 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.61378134  max2yI-1-2-val= 0.9963504
"
 "
Step 1.2: FIND  ri-1-2-vals= (4.7555775E-4 4.7555775E-4 4.7555775E-4 0.6142634 0.0886199 0.088611424 4.7555775E-4 4.7555775E-4 4.7555775E-4)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.61378134,  yi-1-2  max2yi-1-2-val= 0.9963504
 WHERE yi-1-1-vals= (0.0010682945 0.0010682945 0.0010682945 0.99304164 0.055169646 0.05516444 0.0010682945 0.0010682945 0.0010682945)
         and yi-1-2-vals= (0.0012603389 0.0012603389 0.0012603389 0.9999815 0.0012603389 0.0012603389 0.0012603389 0.0012603389 0.0012603389)"
 "==>>RESET: All F1,F2 LAYER 1 X and Y nodes RESET"
 "==>>RESET: All F1,F2 LAYER 2 X and Y nodes RESET"
 "==>>RESET: MAX F3 X and Ys in  LAYER 2 X and Y nodes. *reset-all-F3Layer-maxs-p= T"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 2; *tdelta-cycle-n= 1
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399263  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.99964035 (at F3y-max-index= 2)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399263;  initial was-reset-p= T; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 1.0660666, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.62709797;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= T, res= 1.0660666  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (0 0 0 1.0660666 0 0 0 0 0)>>> resetnouti-2-2-vals= (0 1.0660666 0 0 0)
  *my-reset-broadcast= T    max-Index 2
  *skip-reset= NIL  updated was-reset-p= T 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 999 0.01 0.01 0.01)
                  and xi-2-3-vals= (999 1.564617 1.564617 1.564617 1.564617)
                and xi-3-3-vals= (0.0010001 999 0.0010001 0.0010001 0.0010001); max-xi-1-3= 2 max-xi-2-3= 1 max-xi-3-3= 2
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 999 0.01 0.01 0.01)
                  and yi-2-3-vals= (999 0.44719902 0.44719902 0.44719902 0.44719902)
                and yi-3-3-vals= (0.001838074 999 0.001838074 0.001838074 0.001838074)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 23; *pattern-cycle-n= 2 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0929834 1.0826514 1.0761641 1.5530461) 
FOR  resetnout-vals= (0 999 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.13348539 0.2657355 0.3999697 0.8848874 1.0150068 1.1532576 1.2886168 1.4259086 1.5530014);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (1.0E-7 4.47199E-5 4.47199E-5 4.47199E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.5530461;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.5530461)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 999 0.0010001 0.0010001 0.0010001)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 999 0.0010001 0.0010001 0.0010001)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.001838074;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.001838074 999 0.001838074 0.001838074 0.001838074)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.593307 after w loop:
; L2norm-xI-1-3= 1.553307
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.006437877 0.006437877 0.006437877 0.006437877 0.999832);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.593307 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 1.5530461;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 0.01 1.5530461)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 5 y-max-value 0.999832;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.01 0.999832)
"
 "
STEP 3: FIND xi-2-3-vals= (1.5530015 1.5530461 1.5530461 1.5530461 1.5530461)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44718862 0.44720146 0.44720146 0.44720146 0.44720146);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.5530015 1.5530461 1.5530461 1.5530461 1.5530461)
 L2norm-xI-2-3= 3.472811
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.9998321),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.001000116 0.001000116 0.001000116 0.001000116 0.999848);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 0.9998321)
 L2norm-xI-3-3= 0.9999841
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 2  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 100.06568 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7866929E-4 3.1809602E-4 -5.2169562E-5 0.57747627 0.57711435 0.5770589 2.8393185E-4 3.4625835E-5 4.529059E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 173.28102 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.188833 0.58711434 0.5870589 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.57747627 0.57711435 0.5770589 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611357 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001071838 0.001071838 0.001071838 0.992798 0.057208307 0.05720291 0.001071838 0.001071838 0.001071838), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.222746"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.992798 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.992798 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.680988E-4 9.680988E-4 9.680988E-4 0.9611265 9.680988E-4 9.680988E-4 9.680988E-4 9.680988E-4 9.680988E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0329524"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 2 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.9711265 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0117762 after w loop:
; L2norm-xi-1-2= 0.97177625 "
 "
Step 3: FIND yi-1-2-vals=  (0.01087197 0.01087197 0.01087197 0.9598234 0.01087197 0.01087197 0.01087197 0.01087197 0.01087197)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0117762 "
 "
Step 4.2: FIND yi-2-2-vals=(0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.031722777"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.2108 0.21180001 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.838575E-4 9.946575E-4 0.0012064575 0.34939188),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.001 0.6)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.6786853 0.6630707 0.6868111 0.6722072 0.6868491 0.6781154 0.6643377 0.6831337 0.6646228)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.34939188"
 "
Step 5: FIND yi-3-2-vals= (0.3284621 0.32090512 0.33239472 0.3253269 0.3324131 0.3281863 0.3215183 0.33061498 0.3216563), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 2.0662515"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 0.9698234 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.57747627  max2yI-1-2-val= 0.9598234
"
 "
Step 1.2: FIND  ri-1-2-vals= (-0.32656989 -0.32656989 -0.32656989 1.3907755 -0.22935987 -0.22936923 -0.32656989 -0.32656989 -0.32656989)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.57747627,  yi-1-2  max2yi-1-2-val= 0.9598234
 WHERE yi-1-1-vals= (0.001071838 0.001071838 0.001071838 0.992798 0.057208307 0.05720291 0.001071838 0.001071838 0.001071838)
         and yi-1-2-vals= (0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)"
 "==>>RESET: All F1,F2 LAYER 1 X and Y nodes RESET"
 "==>>RESET: All F1,F2 LAYER 2 X and Y nodes RESET"
 "==>>RESET: MAX F3 X and Ys in  LAYER 2 X and Y nodes. *reset-all-F3Layer-maxs-p= T"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 2; *tdelta-cycle-n= 2
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399186  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.999848 (at F3y-max-index= 5)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399186;  initial was-reset-p= T; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 2.7829097, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 1.6370056;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= T, res= 2.7829097  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (2.7829097 0 0 1.0660666 0 0 0 0 0)>>> resetnouti-2-2-vals= (0 1.0660666 0 0 2.7829097)
  *my-reset-broadcast= T    max-Index 5
  *skip-reset= NIL  updated was-reset-p= T 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 0.01 0.01 0.01 999)
                  and xi-2-3-vals= (1.5530015 999 1.5530461 1.5530461 1.5530461)
                and xi-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 999); max-xi-1-3= 5 max-xi-2-3= 2 max-xi-3-3= 5
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.01 0.01 0.01 999)
                  and yi-2-3-vals= (0.44718862 999 0.44720146 0.44720146 0.44720146)
                and yi-3-3-vals= (0.001000116 0.001000116 0.001000116 0.001000116 999)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 24; *pattern-cycle-n= 2 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.3184613 1.8279656 1.3077576 1.324087) 
FOR  resetnout-vals= (0 0 0 0 999)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.21510113 0.41574636 0.6272239 0.82966787 1.0414454 1.2565082 1.4637046 1.6787045 1.8798301);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.471886E-5 1.0E-7 4.4720146E-5 4.4720146E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 4 y-max-value 1.324087;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 1.324087 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 999)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.0010001 999)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.001000116;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.001000116 0.001000116 0.001000116 0.001000116 999)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.3643758 after w loop:
; L2norm-xI-1-3= 1.3243759
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.007550726 0.007550726 0.007550726 0.9997819 0.007550726);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.3643758 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 4 y-max-value 1.324087;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 1.324087 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 4 y-max-value 0.9997819;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.9997819 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.8798748 1.8798303 1.8798748 1.8798748 1.8798748)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44720382 0.4471932 0.44720382 0.44720382 0.44720382);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.8798748 1.8798303 1.8798748 1.8798748 1.8798748)
 L2norm-xI-2-3= 4.20362
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.999782 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010001659 0.0010001659 0.0010001659 0.99984795 0.0010001659);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.999782 0.0010001)
 L2norm-xI-3-3= 0.9999341
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 4 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=4  wdn-vals= (0.45213968 0.41246766 0.41049165 0.5188677 0.41261968 0.5258597 0.43085969 0.47569966 0.40091568)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997819"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=4  wup-vals= (0.5496477 0.6109037 0.6031517 0.54911566 0.60733164 0.5886357 0.56819165 0.6097637 0.55033166)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.9997819"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 3  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 100.06568 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7866929E-4 3.1809602E-4 -5.2169562E-5 0.57747627 0.57711435 0.5770589 2.8393185E-4 3.4625835E-5 4.529059E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 173.28102 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.188742 0.58711434 0.5870589 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.57747627 0.57711435 0.5770589 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611265 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010718474 0.0010718474 0.0010718474 0.9927978 0.057208814 0.057203412 0.0010718474 0.0010718474 0.0010718474), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.222655"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.9927978 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.9927978 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.6809905E-4 9.6809905E-4 9.6809905E-4 0.96112657 9.6809905E-4 9.6809905E-4 9.6809905E-4 9.6809905E-4 9.6809905E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0329522"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 3 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.97112656 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0117763 after w loop:
; L2norm-xi-1-2= 0.9717763 "
 "
Step 3: FIND yi-1-2-vals=  (0.010871969 0.010871969 0.010871969 0.95982337 0.010871969 0.010871969 0.010871969 0.010871969 0.010871969)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0117763 "
 "
Step 4.2: FIND yi-2-2-vals=(0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.031722777"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.2108 0.40091568 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.838575E-4 9.946575E-4 0.24154407 0.24212438),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.6 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.58821595 0.5644777 0.56337417 0.62832147 0.5646463 0.63254047 0.57563675 0.6024529 0.5573553)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.24212438"
 "
Step 5: FIND yi-3-2-vals= (0.32660377 0.31342325 0.3128105 0.34887216 0.31351686 0.35121474 0.31961924 0.33450878 0.30946857), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.8010078"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 0.96982337 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 25; *pattern-cycle-n= 3 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.3143857 1.8206207 1.301784 1.7043094 1.8729113) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.21388415 0.40985137 0.60886896 0.8259646 1.0257036 1.2558571 1.4618297 1.6793617 1.8728666);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4720382E-5 4.471932E-5 4.4720382E-5 4.4720382E-5 4.4720382E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  3.6663208 after w loop:
; L2norm-xI-1-3= 3.6263209
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.36245707 0.50205726 0.35898203 0.46998304 0.516477);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 3.6663208 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 4 y-max-value 1.7043094;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 1.7043094 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 4 y-max-value 0.46998304;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.46998304 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.8729113 1.8729113 1.8729113 1.8729113 1.8729113)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.4472016 0.4472016 0.4472016 0.4472016 0.4472016);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.8729113 1.8729113 1.8729113 1.8729113 1.8729113)
 L2norm-xI-2-3= 4.1880694
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.47008303 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.002126544 0.002126544 0.002126544 0.99955225 0.002126544);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.47008303 0.0010001)
 L2norm-xI-3-3= 0.4702936
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 3  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 109.98366 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7277482E-4 3.0760173E-4 -5.0448438E-5 0.61377287 0.5580748 0.5580212 2.7456466E-4 3.3483495E-5 4.379641E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 179.19277 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.225039 0.56807477 0.5680212 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.61377287 0.5580748 0.5580212 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611265 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010683048 0.0010683048 0.0010683048 0.9930415 0.05517063 0.055165425 0.0010683048 0.0010683048 0.0010683048), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.256688"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.9930415 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.9930415 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.6787065E-4 9.6787065E-4 9.6787065E-4 0.9611357 9.6787065E-4 9.6787065E-4 9.6787065E-4 9.6787065E-4 9.6787065E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.033196"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 3 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.9711357 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0117854 after w loop:
; L2norm-xi-1-2= 0.9717854 "
 "
Step 3: FIND yi-1-2-vals=  (0.010871871 0.010871871 0.010871871 0.9598238 0.010871871 0.010871871 0.010871871 0.010871871 0.010871871)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0117854 "
 "
Step 4.2: FIND yi-2-2-vals=(0.011334671 0.011334671 0.011334671 0.99932975 0.011334671 0.011334671 0.011334671 0.011334671 0.011334671)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.9704738"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.2108 0.40091568 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.838575E-4 9.946575E-4 0.24154407 0.24212438),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.6 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.28431973 0.26058146 0.2594779 1.3124204 0.26075006 0.32864425 0.27174047 0.29855666 0.25345904)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.24212438"
 "
Step 5: FIND yi-3-2-vals= (0.18104862 0.16593261 0.1652299 0.8357208 0.16603998 0.20927352 0.17303843 0.1901144 0.1613972), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.5704054"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 9.317032 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 8.357208 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 26; *pattern-cycle-n= 3 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0057942 1.3964088 0.99287904 1.2865856 1.4265151) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.11856394 0.22231296 0.3274362 0.8474874 0.95327 1.0904085 1.2019198 1.3255518 1.4264704);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.472016E-5 4.472016E-5 4.472016E-5 4.472016E-5 4.472016E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  2.8037453 after w loop:
; L2norm-xI-1-3= 2.7637453
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.36392432 0.5052596 0.3592513 0.46552247 0.51615286);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 2.8037453 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 4 y-max-value 1.2865856;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 0.01 1.2865856 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 4 y-max-value 0.46552247;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.01 0.46552247 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.4265151 1.4265151 1.4265151 1.4265151 1.4265151)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719738 0.44719738 0.44719738 0.44719738 0.44719738);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.4265151 1.4265151 1.4265151 1.4265151 1.4265151)
 L2norm-xI-2-3= 3.1899004
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.46562243 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.002146902 0.002146902 0.002146902 0.9995457 0.002146902);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.0010001 0.46562243 0.0010001)
 L2norm-xI-3-3= 0.46583405
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 4 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=4  wdn-vals= (0.45535153 0.42520082 0.42369905 0.50606484 0.42531636 0.51137877 0.43917876 0.47325712 0.41642132)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.46552247"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=4  wup-vals= (0.5294576 0.5760122 0.5701207 0.5290533 0.57329745 0.5590885 0.543551 0.5751458 0.52997745)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.46552247"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 4  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 109.98609 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7277338E-4 3.0759914E-4 -5.044802E-5 0.61378134 0.5580701 0.55801654 2.7456236E-4 3.3483215E-5 4.3796044E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 179.19426 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.225138 0.5680701 0.5680165 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.61378134 0.5580701 0.55801654 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611357 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010682945 0.0010682945 0.0010682945 0.99304164 0.055169654 0.05516445 0.0010682945 0.0010682945 0.0010682945), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.256786"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.99304164 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.99304164 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.678705E-4 9.678705E-4 9.678705E-4 0.9611357 9.678705E-4 9.678705E-4 9.678705E-4 9.678705E-4 9.678705E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0331961"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 4 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 10.954433 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 10.994582 after w loop:
; L2norm-xi-1-2= 10.954582 "
 "
Step 3: FIND yi-1-2-vals=  (0.0010004928 0.0010004928 0.0010004928 0.9963483 0.0010004928 0.0010004928 0.0010004928 0.0010004928 0.0010004928)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 10.994582 "
 "
Step 4.2: FIND yi-2-2-vals=(0.0011806135 0.0011806135 0.0011806135 0.999983 0.0011806135 0.0011806135 0.0011806135 0.0011806135 0.0011806135)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 9.31719"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.2108 0.41642132 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.838575E-4 9.946575E-4 0.25084746 0.25142777),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.001 0.6 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.27609283 0.25806734 0.2572483 1.3053919 0.25821403 0.30980164 0.26657787 0.2869371 0.2526084)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.25142777"
 "
Step 5: FIND yi-3-2-vals= (0.17762377 0.1660271 0.16550018 0.8398213 0.16612147 0.19931026 0.17150234 0.1846004 0.1625151), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.5543687"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 9.394561 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 8.398212 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.61378134  max2yI-1-2-val= 0.9963483
"
 "
Step 1.2: FIND  ri-1-2-vals= (5.555727E-4 5.555727E-4 5.555727E-4 0.61425984 0.08869993 0.08869145 5.555727E-4 5.555727E-4 5.555727E-4)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.61378134,  yi-1-2  max2yi-1-2-val= 0.9963483
 WHERE yi-1-1-vals= (0.0010682945 0.0010682945 0.0010682945 0.99304164 0.055169654 0.05516445 0.0010682945 0.0010682945 0.0010682945)
         and yi-1-2-vals= (0.0011806135 0.0011806135 0.0011806135 0.999983 0.0011806135 0.0011806135 0.0011806135 0.0011806135 0.0011806135)"
 "==>>RESET: All F1,F2 LAYER 1 X and Y nodes RESET"
 "==>>RESET: All F1,F2 LAYER 2 X and Y nodes RESET"
 "==>>RESET: MAX F3 X and Ys in  LAYER 2 X and Y nodes. *reset-all-F3Layer-maxs-p= T"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 4; *tdelta-cycle-n= 1
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399263  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.9995457 (at F3y-max-index= 4)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399263;  initial was-reset-p= T; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 1.0660998, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 0.62711746;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= T, res= 1.0660998  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (2.7829097 0 0 1.0660998 0 0 0 0 0)>>> resetnouti-2-2-vals= (0 1.0660666 0 1.0660998 2.7829097)
  *my-reset-broadcast= T    max-Index 4
  *skip-reset= NIL  updated was-reset-p= T 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (0.01 0.01 0.01 999 0.01)
                  and xi-2-3-vals= (999 1.4265151 1.4265151 1.4265151 1.4265151)
                and xi-3-3-vals= (0.0010001 0.0010001 0.0010001 999 0.0010001); max-xi-1-3= 4 max-xi-2-3= 1 max-xi-3-3= 4
"
 "AFTER RESET Y:  yi-1-3-vals= (0.01 0.01 0.01 999 0.01)
                  and yi-2-3-vals= (999 0.44719738 0.44719738 0.44719738 0.44719738)
                and yi-3-3-vals= (0.002146902 0.002146902 0.002146902 999 0.002146902)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 27; *pattern-cycle-n= 4 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (0.99869454 1.3873066 0.9865176 1.4167012) 
FOR  resetnout-vals= (0 0 0 999 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.116321095 0.22012918 0.32542437 0.8480272 0.9538618 1.0844712 1.1949927 1.3150388 1.4166565);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (1.0E-7 4.4719738E-5 4.4719738E-5 4.4719738E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.99869454;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.99869454 0.01 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 0.0010001 0.0010001 999 0.0010001)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (0.0010001 0.0010001 0.0010001 999 0.0010001)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.002146902;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (0.002146902 0.002146902 0.002146902 999 0.002146902)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.0390449 after w loop:
; L2norm-xI-1-3= 0.9990449
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.9996493 0.01000956 0.01000956 0.01000956 0.01000956);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.0390449 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.99869454;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.99869454 0.01 0.01 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 1 y-max-value 0.9996493;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.9996493 0.01 0.01 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.4166566 1.4167012 1.4167012 1.4167012 1.4167012)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44718602 0.4472001 0.4472001 0.4472001 0.4472001);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.4166566 1.4167012 1.4167012 1.4167012 1.4167012)
 L2norm-xI-2-3= 3.1679359
 "
 "
STEP 5: FIND xI-3-3-vals= (0.9996494 0.0010001 0.0010001 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.9998479 0.0010002987 0.0010002987 0.0010002987 0.0010002987);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.9996494 0.0010001 0.0010001 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.99980146
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 4  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 100.06568 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7866929E-4 3.1809602E-4 -5.2169562E-5 0.57747627 0.57711435 0.5770589 2.8393185E-4 3.4625835E-5 4.529059E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 173.28102 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.188833 0.58711434 0.5870589 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.57747627 0.57711435 0.5770589 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611357 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.001071838 0.001071838 0.001071838 0.992798 0.057208307 0.05720291 0.001071838 0.001071838 0.001071838), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.222746"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.992798 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.992798 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.680988E-4 9.680988E-4 9.680988E-4 0.9611265 9.680988E-4 9.680988E-4 9.680988E-4 9.680988E-4 9.680988E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0329524"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 4 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.9711265 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0117762 after w loop:
; L2norm-xi-1-2= 0.97177625 "
 "
Step 3: FIND yi-1-2-vals=  (0.01087197 0.01087197 0.01087197 0.9598234 0.01087197 0.01087197 0.01087197 0.01087197 0.01087197)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0117762 "
 "
Step 4.2: FIND yi-2-2-vals=(0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.031722777"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.2108 0.41642132 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 0.12012001 0.12070367 0.12091447 0.12133089 0.1219112),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.6 0.001 0.001 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.44964674 0.45435375 0.46653408 0.52020854 0.4765942 0.45279026 0.5529671 0.53877694 0.4371421)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.1219112"
 "
Step 5: FIND yi-3-2-vals= (0.3007972 0.30394602 0.3120942 0.34800047 0.31882408 0.3029001 0.3699147 0.36042205 0.29243207), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.4948502"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 0.9698234 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>>  TEST-RESET AFTER F2-CYCLE >>>>>>>>>>>>
"
 "
>>>>>> IN TEST-RESET  *overall-cycle-n= 1 >>>>
STEP 1: FIND  RI,  vector components betw yi-1-1 and yi-1-2
 Step 5.1 Find max1yI-1-1-val  (of all yI-1-3)  and max2yi-1-2-val (of all yI-1-2)
  max1yI-1-1-val= 0.57747627  max2yI-1-2-val= 0.9598234
"
 "
Step 1.2: FIND  ri-1-2-vals= (-0.32656989 -0.32656989 -0.32656989 1.3907755 -0.22935987 -0.22936923 -0.32656989 -0.32656989 -0.32656989)
FOR each i;  ri-2-2= (- (/  yi-1-1  max1yi-1-1-val)  (/ yi-1-2  max2yi-1-2-val)) ;   yi-1-1  max1yi-1-1-val= 0.57747627,  yi-1-2  max2yi-1-2-val= 0.9598234
 WHERE yi-1-1-vals= (0.001071838 0.001071838 0.001071838 0.992798 0.057208307 0.05720291 0.001071838 0.001071838 0.001071838)
         and yi-1-2-vals= (0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)"
 "==>>RESET: All F1,F2 LAYER 1 X and Y nodes RESET"
 "==>>RESET: All F1,F2 LAYER 2 X and Y nodes RESET"
 "==>>RESET: MAX F3 X and Ys in  LAYER 2 X and Y nodes. *reset-all-F3Layer-maxs-p= T"
 "
=>>FROM TEST-RESET;  *pattern-cycle-n = 4; *tdelta-cycle-n= 2
 Step 5: IF (> l2norm-yi-1-1-e *min-input-criteria), l2norm-yi-1-1-e= 1.0399186  *min-input-criteria= 0.2
ALSO Cycle > 1;
Step 6: IF (> F3y-max-value *reset-y-criteria),   F3y-max-value= 0.9998479 (at F3y-max-index= 1)  *reset-y-criteria= 0.4;   l2norm-yi-1-1-e= 1.0399186;  initial was-reset-p= T; %; [IF Step 3 = NIL, res= 0]
Step 5:  res=(* *vigilance-multiplier  l2norm-r)= 2.7829097, *VIGILANCE-MULTIPLIER= 1.7,  l2norm-r= 1.6370056;  *skip-reset= NIL  
 ** RESET TEST: (> res (- 1.9 vigilance))= T, res= 2.7829097  (- 1.9 vigilance)= 1.0, vigilance= 0.9;"
 "RESET VALUES: resetnini-2-2-vals= (2.7829097 0 0 1.0660998 0 0 0 0 0)>>> resetnouti-2-2-vals= (2.7829097 1.0660666 0 1.0660998 2.7829097)
  *my-reset-broadcast= T    max-Index 1
  *skip-reset= NIL  updated was-reset-p= T 
=== END TESTRESET ===="
 "AFTER RESET X: xi-1-3-vals= (999 0.01 0.01 0.01 0.01)
                  and xi-2-3-vals= (1.4166566 999 1.4167012 1.4167012 1.4167012)
                and xi-3-3-vals= (999 0.0010001 0.0010001 0.0010001 0.0010001); max-xi-1-3= 1 max-xi-2-3= 2 max-xi-3-3= 1
"
 "AFTER RESET Y:  yi-1-3-vals= (999 0.01 0.01 0.01 0.01)
                  and yi-2-3-vals= (0.44718602 999 0.4472001 0.4472001 0.4472001)
                and yi-3-3-vals= (999 0.0010002987 0.0010002987 0.0010002987 0.0010002987)
"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 28; *pattern-cycle-n= 4 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.8083108 1.2890681 1.611897 1.8594186) 
FOR  resetnout-vals= (999 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.19698411 0.3870257 0.58558757 0.80214084 1.005261 1.2037536 1.4421382 1.6765217 1.8593739);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (1.0E-7 4.4720008E-5 4.4720008E-5 4.4720008E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 1.2890681;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 1.2890681 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (999 0.0010001 0.0010001 0.0010001 0.0010001)
"
 ">>>>>  BEGIN  competitive-F-output for  yI-3-3  >>>>>>>>>>>>>>>"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.0010001;   *onCenterThreshold= 0.25
POST-COMPET XI-3-3-vals= (999 0.0010001 0.0010001 0.0010001 0.0010001)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.0010002987;   *onCenterThreshold= 0.25
POST-COMPET YI-3-3-vals= (999 0.0010002987 0.0010002987 0.0010002987 0.0010002987)
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  1.329362 after w loop:
; L2norm-xI-1-3= 1.2893621
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.007755773 0.007755773 0.999772 0.007755773 0.007755773);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 1.329362 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 1.2890681;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 1.2890681 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.999772;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.999772 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.8594186 1.859374 1.8594186 1.8594186 1.8594186)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44720367 0.44719294 0.44720367 0.44720367 0.44720367);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.8594186 1.859374 1.8594186 1.8594186 1.8594186)
 L2norm-xI-2-3= 4.157879
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.99977214 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0010001758 0.0010001758 0.99984795 0.0010001758 0.0010001758);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.99977214 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.9999242
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 3 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=3  wdn-vals= (0.4618653 0.50822527 0.5264653 0.43374527 0.52494526 0.5138493 0.4793453 0.4042573 0.40015328)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.999772"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=3  wup-vals= (0.5558013 0.5910653 0.61363727 0.57145727 0.5542053 0.59250927 0.5623373 0.5452373 0.6149293)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.999772"
 "
==>> END UPDATE WEIGHTS ==========
"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 1 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 5  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 100.06568 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7866929E-4 3.1809602E-4 -5.2169562E-5 0.57747627 0.57711435 0.5770589 2.8393185E-4 3.4625835E-5 4.529059E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 173.28102 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.188742 0.58711434 0.5870589 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.57747627 0.57711435 0.5770589 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611265 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010718474 0.0010718474 0.0010718474 0.9927978 0.057208814 0.057203412 0.0010718474 0.0010718474 0.0010718474), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.222655"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.9927978 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.9927978 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.6809905E-4 9.6809905E-4 9.6809905E-4 0.96112657 9.6809905E-4 9.6809905E-4 9.6809905E-4 9.6809905E-4 9.6809905E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.0329522"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 5 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.97112656 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0117763 after w loop:
; L2norm-xi-1-2= 0.9717763 "
 "
Step 3: FIND yi-1-2-vals=  (0.010871969 0.010871969 0.010871969 0.95982337 0.010871969 0.010871969 0.010871969 0.010871969 0.010871969)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0117763 "
 "
Step 4.2: FIND yi-2-2-vals=(0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309 0.3152309)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.031722777"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.40015328 0.41642132 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.838575E-4 0.24087584 0.24129227 0.24187258),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.6 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.5942147 0.62200445 0.633005 0.57749916 0.63209194 0.62548525 0.6048522 0.5598445 0.5571035)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.24187258"
 "
Step 5: FIND yi-3-2-vals= (0.3222115 0.33728045 0.34324548 0.31314754 0.34275037 0.3391679 0.32797968 0.30357435 0.30208808), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.8441758"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 0.96982337 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 29; *pattern-cycle-n= 5 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.3135681 1.8217913 1.6946961 1.6253787 1.8734704) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.21100778 0.42189163 0.6402727 0.8351377 1.053501 1.2757602 1.4871205 1.6845358 1.8734257);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4720364E-5 4.4719295E-5 4.4720364E-5 4.4720364E-5 4.4720364E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  3.7908633 after w loop:
; L2norm-xI-1-3= 3.7508633
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.3502042 0.4856992 0.45181495 0.43333456 0.49947712);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 3.7908633 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 1.6946961;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 1.6946961 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.45181495;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.45181495 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.8734704 1.8734704 1.8734704 1.8734704 1.8734704)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44720164 0.44720164 0.44720164 0.44720164 0.44720164);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.8734704 1.8734704 1.8734704 1.8734704 1.8734704)
 L2norm-xI-2-3= 4.189319
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.45191494 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0022119747 0.0022119747 0.9995244 0.0022119747 0.0022119747);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.45191494 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.45212996
 "
 "
============> END  F3-cycle =======================%"
 "=======> START  run-art-pattern-cycle: tdelta-cycle-n= 2 
 >>>>> STEP 1: BEGIN  F1-CYCLE >>>>>>>>>>>>>>>"
 ">>>>> IN  F1STMcycle, *n-inputs= 9
 "
 "
==> IN  F1-CYCLE, FOR NEW  RUN-CYCLE, *overall-cycle-n= 1; **pattern-cycle-n= 5  *n-pattern-cycles= 5;
 INPUT-VALS= (-0.04096 0.04512 -0.019039996 100.05568 99.99296 99.98336 0.0392 -0.0040000007 0.06848)


STEP 1: FIND xi-1-1, RESULTS xi-1-1-vals= (-0.030959998 0.055120003 -0.009039995 109.98366 100.00296 99.99336 0.049200002 0.006 0.07848);  
FOR each i;  xi-1-1= (+ input  (* *p1-all  (sigmoid yi-2-1)));  *p1-all= 10.0  %"
 "
Step 2.2 FIND yi-1-1, RESULTS, yi-1-1-vals= (-1.7277482E-4 3.0760173E-4 -5.0448438E-5 0.61377287 0.5580748 0.5580212 2.7456466E-4 3.3483495E-5 4.379641E-4)  
FOR each i; y  i=(/ xi-1-1  L2norm-xi-1-1-e );   L2norm-xi-1-1-e= 179.19277 "
 "
Step 4: FIND XI-2-1-VALS= (0.011000001 0.011000001 0.011000001 10.225039 0.56807477 0.5680212 0.011000001 0.011000001 0.011000001) 
FOR each i; xi-2-1=  (+ sig-yi-1-1 sigp-yi-3-1));   *p1-all= 10.0 %sig-yi-1-1-vals= (0.001 0.001 0.001 0.61377287 0.5580748 0.5580212 0.001 0.001 0.001)
sigp-yi-3-1-vals= (0.010000001 0.010000001 0.010000001 9.611265 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)
"
 "
Step 3: FIND yi-2-1, RESULTS FOR yi-2-1-vals= (0.0010683048 0.0010683048 0.0010683048 0.9930415 0.05517063 0.055165425 0.0010683048 0.0010683048 0.0010683048), 
FOR each i; yi-2-1= (/ xi-2-1 L2norm-xi-2-1);  L2norm-xi-2-1= 10.256688"
 "
Step 4: FIND xi-3-1 RESULTS  xi-3-1-vals= (0.001 0.001 0.001 0.9930415 0.001 0.001 0.001 0.001 0.001), 
FOR each i; xi-3-1  sig-yi-2-1-vals= (0.001 0.001 0.001 0.9930415 0.001 0.001 0.001 0.001 0.001)"
 "
STEP 5: FIND yi-3-1, RESULTS  yi-3-1-vals= (9.6787065E-4 9.6787065E-4 9.6787065E-4 0.9611357 9.6787065E-4 9.6787065E-4 9.6787065E-4 9.6787065E-4 9.6787065E-4),  
FOR each i; yi-3-1= (/ pi  norm-p-e);   L2norm-xi-3-1-e=(+ (L2NORM 'xi-3-1 *n-inputs) e)= 1.033196"
 "============>  END  F1-cycle ==============%"
 "  tdelta-cycle-n >>>>> STEP 2: BEGIN  F2-CYCLE >>>>>>>>>>>>>>>"
 "
>>>>> IN  F2-cycle, *pattern-cycle-n= 5 *n-inputs= 9 "
 "In F2-CYCLE *overall-cycle-n= 1
Step 1: FIND xi-1-2-vals= (0.011000001 0.011000001 0.011000001 0.9711357 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-1-2=(* *p2-all  (+ yi-3-1  (* a  sigp-yI-2-2)));  *p2-all= 10.0 yi-3-1-vals  a=0.7 sigp-yI-2-2= 0.010000001  yi-2-2-vals "
 "
Step 2: FIND yi-1-2,
Step 6.1 UPDATE L2norm-xi-1-2-e= 1.0117854 after w loop:
; L2norm-xi-1-2= 0.9717854 "
 "
Step 3: FIND yi-1-2-vals=  (0.010871871 0.010871871 0.010871871 0.9598238 0.010871871 0.010871871 0.010871871 0.010871871 0.010871871)
FOR each i;  yi-1-2=(my-floor-ceiling (/ xi-1-2  L2norm-xi-1-2-e ) :floor *x-activity-floor :ceiling *x-activity-ceiling); xi-1-2-vals  L2norm-xi-1-2-e= 1.0117854 "
 "
Step 4.2: FIND yi-2-2-vals=(0.011334671 0.011334671 0.011334671 0.99932975 0.011334671 0.011334671 0.011334671 0.011334671 0.011334671)  , 
FOR each i;  yi-2-2= (/ v-activity0i L2norm-v);  L2norm-xi-2-2= 0.9704738"
 "
Step 4.1: FIND sum-F3dn,  Inside loop (j to *n-outputs),
 RESULTS sum-F3dn-vals= (For i=  9 0.2002 0.58365745 0.40015328 0.41642132 0.58030904)
 wdn-vals= 5 *n-outputs= (For i=  9 2.0020001E-4 7.838575E-4 0.24087584 0.24129227 0.24187258),
FOR each j, i:   sum-F3dn= (+ sum-F3dn (* sig-yi-1-3-vals wdn)); 
sig-yi-1-3-vals= (For i=  9 0.001 0.001 0.6 0.001 0.001)
"
 "
Step 4.2 FIND xi-3-2-vals= (0.29031846 0.3181082 0.3291088 1.261598 0.3281957 0.321589 0.30095598 0.25594828 0.25320724)
FOR each i;  xi-3-2=(+ yi-2-2  sum-F3dn);  sum-F3dn= 0.24187258"
 "
Step 5: FIND yi-3-2-vals= (0.18583712 0.20362574 0.21066739 0.8075674 0.21008289 0.20585385 0.19264636 0.16383626 0.16208168), 
FOR each i; yi-3-2= (/ xi-3-2  L2norm-xi-3-2-e);   L2norm-xi-3-2-e=(+ (L2NORM 'xi-3-2 *n-inputs) e)= 1.56222"
 "
Step 7: FIND xi-2-2-vals= (0.011000001 0.011000001 0.011000001 9.035498 0.011000001 0.011000001 0.011000001 0.011000001 0.011000001)
FOR each i;  xi-2-2=(sigmoid (+ yi-3-2 (* b xi-2-2)));  sigp-yI-3-2-vals= (0.010000001 0.010000001 0.010000001 8.075674 0.010000001 0.010000001 0.010000001 0.010000001 0.010000001)  *p2-all= 10.0%"
 ">>>>> IN F3-CYCLE: *art-overall-cycle-n= 30; *pattern-cycle-n= 5 <<<<<<

"
 "F3 STEP 1: Find F3 INPUT ACTIVITY, XI-1-3;
  xI-1-3-vals= (1.0464175 1.4554139 1.3501829 1.2834535 1.4864012) 
FOR  resetnout-vals= (0 0 0 0 0)

Step 1.1: FIND sum-yi-3-2-up-vals= (For j=  5 0.1216998 0.24901635 0.383048 0.88557995 1.0194219 1.1543194 1.2784667 1.3850099 1.4863565);
 FOR each i;  sum-yi-3-2-up=(+ sum-yi-3-2-up (* yi-3-2  wUp )),
 FOR sigp-yI-2-3-vals= (4.4720164E-5 4.4720164E-5 4.4720164E-5 4.4720164E-5 4.4720164E-5);
 Where  sigp-yI-2-3= (* *p3-all (sigmoid yi-2-3))  
*F3-compet-every-nth-time-interval= 2
"
 "
STEP 2: FIND YI-1-3
 FIND 
 Step 2.1: Find  L2norm-xI-1-3-e=  3.0222056 after w loop:
; L2norm-xI-1-3= 2.9822057
 "
 "
STEP 2.2 FIND PRE-COMPET yI-1-3-vals= (0.3508871 0.48803273 0.45274642 0.43037054 0.49842346);
 FOR each J;  yi-1-3 i=(/ xi-1-3  L2norm-xI-1-3-e ) ;   L2norm-xI-1-3-e= 3.0222056 "
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 1.3501829;   *onCenterThreshold= 0.25
POST-COMPET XI-1-3-vals= (0.01 0.01 1.3501829 0.01 0.01)
"
 "
===> IN COMPETITIVE-F-OUTPUT *overall-cycle-n= 1 
FOR n-nodes= 5; y-max-index= 3 y-max-value 0.45274642;   *onCenterThreshold= 0.25
POST-COMPET YI-1-3-vals= (0.01 0.01 0.45274642 0.01 0.01)
"
 "
STEP 3: FIND xi-2-3-vals= (1.4864012 1.4864012 1.4864012 1.4864012 1.4864012)
  sig-yi-1-3-vals= NIL
;   sigp-yI-3-3-vals= NIL  *p2-all= 10.0%"
 "
STEP 4: FIND  yI-2-3-vals= (0.44719812 0.44719812 0.44719812 0.44719812 0.44719812);
  FOR yI-2-3= (/  xI-2-3  L2norm-xI-2-3);
 xI-2-3-vals= (1.4864012 1.4864012 1.4864012 1.4864012 1.4864012)
 L2norm-xI-2-3= 3.3238092
 "
 "
STEP 5: FIND xI-3-3-vals= (0.0010001 0.0010001 0.45284638 0.0010001 0.0010001),
 FOR  xI-3-3=  (sigmoid yi-2-3));
  sig-yI-2-3-vals=  NIL
 "
 "
STEP 6: FIND  yI-3-3-vals= (0.0022074283 0.0022074283 0.9995259 0.0022074283 0.0022074283);
  FOR yI-3-3= (/  xI-3-3  L2norm-xI-3-3);
 xI-3-3-vals= (0.0010001 0.0010001 0.45284638 0.0010001 0.0010001)
 L2norm-xI-3-3= 0.45306116
 "
 "
============> END  F3-cycle =======================%"
 "
==>> BEGIN UPDATE-WEIGHTS; Largest output  max-nonreset-outvar-index= 3 "
 "
Step 1: FIND wDN FOR max-nonreset-outvar-index=3  wdn-vals= (0.45967677 0.49491033 0.5087728 0.43830556 0.50761754 0.4991846 0.47296157 0.4158947 0.41277564)
 wdn= (+ wdn (* downLR   d  (- max-outvar-val   wdn)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.45274642"
 "
Step 1: FIND Wup FOR max-nonreset-outvar-index=3  wup-vals= (0.5310681 0.5578688 0.5750235 0.54296667 0.5298552 0.55896616 0.5360355 0.52303946 0.5760054)
 wup= (+ wup (* downLR   d  (- max-outvar-val   wup)))) % downLR= 0.4  d= 0.6  max-outvar-val= 0.45274642"
 "
==>> END UPDATE WEIGHTS ==========
")