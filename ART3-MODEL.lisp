;;****************************** ART3-MODEL.lisp *************************
;;
;; From ART 3: Hierarchical Search Using Chemical Transmitters in Self-Organizing Pattern Recognition Architectures; GAlL A. CARPENTER AND STEPHEN GROSSBERG; Neural Networks, Vol. 3. pp. 129-152, 1990 
;;
#|
GROSSBERG NOTATION:
   >FOR VARIABLES:  var; subsc=var-num; supersc=field-letter,modifier=layer-num
  > FOR PARAMETERS:  parameter;subsc=layer; supersc=field


MY NOTATION: 
;; (note: each class VAR SYMBOL EVALS TO A LIST OF VAR SYMBOLS)
  >FOR VARIABLES:  note: each my var SYMBOL EVALS to its VAR LIST
   ;;1-DIM VAR SYMBOL: var; var-num; hyphen;layer-num;hyphen; field-num; hyphen; module-num 
   ;;2-DIM-VAR SYMBOL: var; var-from-num; hyphen;var-to-num ;hyphen; layer-num;hyphen; field-from-num; hyphen; field-to-num; hyphen;  module-from-num; hyphen; module-to-num
   OR ;;note: 2-dim vars in ART3 begin with 0 to indicate they are 2dim
   ;;1-D1M VAR LIST: (var-name (var-num layer-num field-num module-num) num-last-field value)
   ;;2-DIM VAR LIST:  (var-name (var-from-num var-to-num  from-layer-num to-layer-num  from-field-num to-field-num from-module-num to-module-num) num-last-field value)
  >PARAMETERS: parameter;layer-num; hyphen; field-num; hyphen; module-num OR
       parameter (layer-num field-num module-num)
  ;;Note: Each parameter symbol evals to its value.
 
;;xxxx                                                                (@= LTM, specific node, 
                                                                          O= non-specific signal,

       AAA                                {yj-3-3}<----------------------------{xj-3-3} 
                                                { #6     }<--------------O------------{ #5    }
                                                   |                                                   ^
                                                   |                                                    |
                                             p2-3 * Sj-3-3                                 Sj-2-3
                                                   |                                                   |
                                                  v                                                   |                  F3   
   { }-------from reset? ------>{xj-2-3}---------------------------->{yj-2-3}
                                               {  #3   } -------------O------------>{ #4    }
                                                  ^                                                    |
                                                  |                                                     |
                                                Sj-1-3                                    p1-3 * Sj-2-3   
                                                  |                                                     |
                                                  |                                                    v
   [me-yj-1-3 used                 {yj-1-3}<----------------------------{xj-1-3}
   1. for ONLY competative {  #2    }<------------O--------------{ #1    }     
       on-center, off- in F1-3       ||                                                    @ zi-j-2-3
   2.for UPDATE-WEIGHTS]  ||                                                    ||
                                                  ||                                                     ||
    { }-------from reset ------> Sj-1-3 ADAPTIVE SYN F2-F3    Si-3-2  ===========
        [NOTE: There are *n-inputs X *n-outputs paths betw F2-F3; but only *n-inputspaths WITHIN F1 and betw F2 & *n-outputs paths within F3.]
                                                  ||                                                     ||
                                                 @  zj-i-3-2                                      ||
                                               {xi-3-2}---------------------------->{yi-3-2} 
                                               { #4, F3#3B? }------O------------>{ #5    }
                                                  ^                                                   |
                                                   |                                                   |
                                              Si-2-2     [S=signal, g(w)? ]      p2-2 * Si-3-2     F2
                                                  |                                                   |
                                                  |                                                  v                  
   {ri-2-2gros }<------------- {yi-2-2}<----------------------------{xi-2-2} <--- from reset??
       {      }<------O------------{ #3     }<------------O-------------{ #6     }   
        {   }<-----from yi-2-1       |                                                  ^
        {   }<-O--from yi-2-1       |                                                  |
                                           p1-2 * Si-2-2                                Si-1-2
                                                  |                                                  |
                                                 \/                                                  |
                                           {xi-1-2}------------------------------->{yi-1-2}
                                           { #1  }---------------O-------------->{ #2    }       
                                                  ^                                      [no down feedback here]
                                                   |                        
                    =========     Si-3-1     NON-ADAPTIVE SYNAPSE  F1-F2  ========= 
                                                   | 
                                            {yi-3-1}<------------------------------{xi-3-1} 
                                             {  #6   }<--------------O--------------{#5     }
                                                  |                                                    ^
                                                  |                                                    |
                                             p2-1 * Si-3-1                                Si-2-1
                                                   |                                                   |                     F1
                                                  v                                                   |
                                              {xi-2-1}----------------------------->{yi-2-1}------> to ri-2-2      
                                              { #3     }--------------O------------>{ #4      }----O--> to ri-2-2
                                                  ^                                                  |
                                                  |                                                   |
                                                Si-1-1                                    p1-1  *  Si-2-1   
                                                  |                                                   |
                                                  |                                                  v
                                               {yi-1-1}<----------------------------{xi-1-1}
                                               {#2      }<---------------O-----------{#1    }
                                                                                                        ^
                                                                                                        |
                                                                                                  INPUT



  SIGNAL FUNCTIONS
    (L - 1, 2, 3)
  Si-L-1 = g1 (yi-L-1)
  Si-L-2 = g2 (yi-L-2)
  Sj-L-3 = g3 (yj-L-3)    [me-note 1,2 use i, 3 uses j]

                       FIGURE 21. ART 3 simulation neural network. Indices i = 1
                             ... rl, = nb and i = 1 . . . n~.
                           The reset ~ acts at all layers 1 and 3 (Section 8).

___________________________________________________________________________

Table 1: NOTATION FOR ART 3 HIERARCHY 
Ff ield = Fa               STM field a
i = i, = 1 ...na             node index, field a
L = 1,2,3                   index, 3 layers of an STM field a
xi-a-L                       STM activity, input node i, layer L,field a
yj-a-L                       STM activity, output node i, layer L,
ga (yj-a-L) =Sj-a-L   signal function, field a
Pk-a                           parameter, field a, k = 1,2 . . . .
ri-b                            STM activity, reset node i, field b
pb                              vigilance parameter, field b
zi-j-b-c                         LTM trace, pathway from node i (field b) to node j (field c)
ui-j-b-c                       intracellular transmitter, pathway from node i (field b) to node ] (field c)
vi-j-b-v                      released transmitter, pathway from node i (field b) to node j (field c)
____________________________________________________________________________

FIGURE 10. NOTATION FOR THE ART CHEMICAL SYNAPSE: NODE i to NODE j.
   (me- note: RESET AFFECTS THESE CHEMICAL TRANSMITTERS)
 i                         PRESYNAPTIC NODE i    
S i = Signal i      PRESYNAPTIC SIGNAL
zij                       PATH WEIGHT
uij                       PRESYNAPTIC TRANSMITTER substance
vij                       RELEASED & BOUND TRANSMITTER substance
xj                        POSTSYNAPTIC  ACTIVATION
___________________________________________________________________________


8. EQUATIONS FOR TRANSMITTER PRODUCTION, RELEASE, AND INACTIVATION
The search mechanism works well if  it possesses a few basic properties. These properties can be realized using one of several closely related sets of equations, with corresponding differences in biophysical interpretation. An illustrative system of equations is described below. 

Equations (1)-(3) govern the dynamics of the variables z, i, u 0, v0, and x i at the i]th pathway and jth node of an ART 3 system.

Presynaptic Transmitter
      du-ij/ dt =   (zij  - uij) - uij * [release rate].                                             (1)

Bound Transmitter
      dv-ij/ di = -vij +  uij * [release rate] -  vij * [inactivation rate]
                    = - v,, + uij * [release rate] -  vij * [reset signal].                      (2)

Postsynaptic Activation
     e * dxi/ dt =  -xi  +  (A -  xi) * [excitatory inputs]
                                 -   (B + xi) * [inhibitory inputs]
                      =  -xi  +  (A  - xi) *  ( SUMi vij  +  {intrafield feedback} )   
                                 -   (B + xi) * [reset signal]                                            (3)


EQUATION (1) says that presynaptic transmitter is produced and/or mobilized until the amount u o of transmitter available for release reaches the maximum level zij. The ADAPTIVE WEIGHT z ij  itself changes on the slower time scale of learning, but REMAINS ESSENTIALLY CONSTANT ON THE TIME SCALE OF A SINGLE RESET EVENT. Available presynaptic transmitter uq is released at a rate that is specified below. A fraction of presynaptic transmitter becomes postsynaptic bound transmitter after being released. For simplicity, we ignore the fraction of released transmitter that is inactivated in the extracellular space. 

EQUATION (2) says that the BOUND TRANSMITTER IS INACTIVATED BY THE RESET SIGNAL.
 
EQUATION (3) for the postsynaptic activity xi  is a shunting membrane equation such that excitatory inputs drive xi up toward a MAXIMUM DEPOLARIZED LEVEL EQUAL TO A;
inhibitory inputs drive xj down toward a MINIMUM HYPERPOLARIZED LEVEL equal to - B; and activity passively decays to a resting level equal to 0 in the absence of inputs. The net effect of bound transmitter at all synapses converging on the jth node is assumed to be excitatory, via the term. 
                                   SUMi vij                 (4)

INTERNAL FEEDBACK from within the target field (Figure 3) is EXCITATORY, while the nonspecific RESET SIGNAL IS INHIBITORY. Parameter e is small, corresponding to the assumption that activation dynamics are fast relative to the transmitter accumulation rate. equal to I in eqn (1).

The ART 3 SYSTEM CAN BE SIMPLIFIED FOR PURPOSES OF SIMULATION. Suppose that  e << 1 in (3); 
the RESET SIGNALS in (2) and (3) are either 0 or >> 1; and net intrafield feedback is excitatory. 
Then eqns (1), (5), and (6) below approximate the main properties of ART 3 system dynamics.

       SIMPLIFIED ART 3 EQUATIONS -----------
       duij/dt  =  (zij  -  uij)  -  uij * [release rate]                                    (1)

       { dvij/dt =  -vij +  uij * [release rate]   ; if reset = 0
       { vij(t)   =   0                                        ;  if reset > 1                       (5)

        xi(t) =  { SUMi vij  +  [intrafield feedback]    ; if reset = 0
                    { 0                                                        ; if reset >> 1         (6)


9. ALTERNATIVE ART 3 SYSTEMS
In eqns (2) and (3), the RESET SIGNAL acts in two ways, by INACTIVATING bound transmitter and DIRECTLY INHIBITING the postsynaptic membrane. 
ALTERNATIVELY, the reset signal may accomplish both these goals in a SINGLE PROCESS if all excitatory inputs in (3) are realized using chemical transmitters.  Letting WJ denote the NET EXCITATORY TRANSMITTER reaching the jth target cell via intrafield feedback, an illustrative system of this type is given by eqns (1), (2), (7), and (8) below.

Presynaptic Transmitter
        duij/dt =  (zij  -  uij)  -  uij * [release rate].                                                 (1)

Bound Transmitter
        duij/dt  =  - vij + uij * [release rate] -  vij * [reset signal].                         (2)

        dwj/dt  =   - wj + [intrafield feedback]  -  wj * reset signal].                     (7)

;;SSS-USE THIS--HOW DOES RELATE TO ART2 EQs?
Postsynaptic Activation
         e * dxj/dt  =  -xi  +  (A  -  xi) (SUMi vij  +  wj).                                       (8)


THE RESET SIGNAL NOW ACTS AS A CHEMICAL MODULATOR THAT INACTIVATES THE MEMBRANE CHANNELS AT WHICH TRANSMITTER IS BOUND. It thus appears in eqns (2) and (7), but NOT IN EQN (8) FOR POSTSYNAPTIC ACTIVATION. When the reset signal can be only 0 or >> 1, the SIMPLIFIED SYSTEM IN SECTION 8 APPROXIMATES BOTH VERSIONS OF THE ART 3 SYSTEM. 

However, IF THE RESET SIGNAL CAN VARY CONTINUOUSLY IN SIZE, eqns (2), (7),and (8) can preserve relative transmitter quantities from all input sources. Thus, THIS SYSTEM IS A BETTER MODEL FOR THE INTERMEDIATE CASES than eqns (2) and (3).
An additional inhibitory term in the postsynaptic  activation eqn (8) helps to suppress transmitter release, as illustrated in Section 25.


10. TRANSMITTER RELEASE RATE
To further specify the ART search model, we now characterize the transmitter release and inactivation rates in eqns (1) and (2). Then we trace the dynamics of the system at key time intervals during the presentation of a fixed input pattern (Figure 11). We first observe system dynamics during a brief time interval after the input turns on (t = 0+), when the signal Sg first arrives at the synapse. We next consider the effect of subsequent internal feedback signals from within the target field, following contrast-enhancement of the inputs. We observe how the ART 3 model responds to a reset signal by implementing a rapid and enduring inhibition of erroneously selected pattern features. Then we analyze how the ART 3 model responds if the input pattern changes. We will begin with the ART Search Hypothesis h Presynaptic transmitter uq is released at a rate jointly proportional to the presynaptic signal Si and a function f(xj), of the postsynaptic activity. That is, in eqns (1), (2), and (5), 

                      release rate = Si * f(xi).                                        (9)

The function f(xj) in eqn (9) has the qualitative properties illustrated in Figure 12. In particular, f(xi) is assumed to have a positive value when xj is at its 0 resting level, so that transmitter u,~ can be released when the signal Si arrives at the synapse. If f(0) were equal to 0, no excitatory signal could reach a postsynaptic node at rest, even if a large presynaptic signal Si were sent to that node. 
The function f(x/) is also assumed to equal 0 when x, is significantly hyperpolarized, but to rise steeply when xj is near 0. 
In the simulations, f(xj) is linear above a small negative threshold.

The form factor Si * f(xi) is a familiar one in the neuroscience and neural network literatures. In particular, such a product is often used to model associative learning, where it links the rate of learning in the ijth pathway to the presynaptic signal Si and the postsynaptic activity xi  Associative learning occurs, however, on a time scale that is much slower than the time scale of transmitter release. On the  fast time scale of transmitter release, the form factor S~f(xj) may be compared to interactions between voltages and ions. In Figure 9, for example, note the dependence of the presynaptic signal on the Na + ion; the postsynaptic signal on the Ca2+ ion; and transmitter release on the joint fluxes of these two ions, 

The ART Search Hypothesis 1 thus formalizes a known type of synergetic relationship between presynaptic and postsynaptic processes in effecting transmitter release. Moreover, the rate of transmitter release is typically a function of the concentration of Ca 2+ in the extracellular space, and this function has qualitative properties similar to the function f(xi) shown in Figure 12 (Kandel & Schwartz, 1981, p. 84; Kuffief, Nicholls, & Martin, 1984, p. 244).

11. SYSTEM DYNAMICS AT INPUT ONSET: AN APPROXIMATELY LINEAR FILTER
Some implications of the ART Search Hypothesis l will now be summarized. Assume that AT TIME T = 0 TRANSMITTER UQ HAS ACCUMULATED TO ITS MAXIMAL LEVEL ZIJ AND THAT ACTIVITY XI AND BOUND TRANSMITTER VIJ  EQUAL 0. 
Consider a time interval t = 0 + immediately after a signal Si arrives at the synapse. During this brief initial interval, the ART equations approximate the linear filter dynamics typical of many neural network models.

In particular, eqns (2) and (9) imply that the amount of bound transmitter is determined by equation 

     dvij/dt =  -vij  +  uij *  Si * f (xi)  -  vij * [inactivation rate].                               (10)

     Thus, at times t = 0,
      dvij/dt  =  zij * Si * f(0)                                                                                       (11)

      and so
      vij(t)  =  K(t) * Si * zij       for times t = 0.                                                          (12)

Because eqn (12) holds at all the synapses adjacent to cell j. eqn (6) implies that

       xi(t) =  SUMi K(t) * S * Zij                                                                              (13)  

Here S denotes the vector (Si .. . Sn), 
Zij denotes the vector (z1j . .... znj) and     i = 1 . . . n. 
Thus, in the initial moments after a signal arrives at the synapse, the small amplitude activity xl at the postsynaptic cell grows in proportion to the dot product of the incoming signal vector  S times the adaptive weight vector Z i.

12. SYSTEM DYNAMICS AFTER INTRAFIELD FEEDBACK: AMPLIFICATION OF TRANSMITTER RELEASE BY POSTSYNAPTIC POTENTIAL

IN THE NEXT TIME INTERVAl, the intrafield feedback signal CONTRAST-ENHANCES the initial signal pattern (13) VIA EQN (6) [me- is eqn 6 g or sigmoid??]  and amplifies the total activity across field Fc in Figure 13a. Figure 13b shows typical contrastenhanced activity profiles: partial compression of the initial signal pattern; or maximal compression, or CHOICE, where ONLY ONE POSTSYNAPTIC NODE remains active (me- eqn 6= g in that case?]  due to the strong competition within the field Fc.

In all, the model behaves initially like a linear filter. The resulting pattern of activity across postsynaptic cells is contrast-enhanced, as required in the ART 2 model as well as in the many other neural network models that incorporate competitive learning  (Grossberg, 1988). For many neural network systems, this combination of computational properties is all that is needed. These models implicitly assume that intracellular transmitter uij is always accumulated up to its target level zij and that postsynaptic activity x/does not alter the rate of transmitter release:

          uij = zij   and   vij =  zij * Si                                       (14)

[FIGURE 13. [omitted] (a) If transmitter is fully accumulated at t = 0, low-amplitude postsynaptic STM activity xj is initially proportional to the dot product of the signal vector S and the weight vector zj . Fields are labeled Fb and Fc for consistency with the ART 3 system in Figure 21. (b) Intrafield feedback rapidly CONTRAST-ENHANCEs the initial STM activity pattern. Large-amplitude activity is then concentrated at one or more  nodes.]

If the linear filtering properties implied by (14) work well for many purposes, why complicate the system by adding additional hypotheses'? Even a new hypothesis that makes a NEURAL NETWORK MORE REALISTIC PHYSIOLOGICALLY needs to be JUSTIFIED FUNCTIONALLY or it will obscure essential system dynamics. Why, then, ADD TWO ADDITIONAL NONLINEARITIES to the portion of a neural network system responsible for transmitting signals from one location to another? The following discussion suggests HOW NONLINEARITIES OF SYNAPTIC TRANSMISSION and neuromodulation can, when embedded in an ART circuit, help to CORRECT CODING ERRORS BY TRIGGERING A PARALLEL SEARCH, allow the system to RESPOND ADAPTIVELY TO REINFORCEMENT, and RAPIDLY RESET ITSELF TO CHANGING INPUT PATTERNS. 

In eqn (10), term
                              uij * Si * f(xi)                         (15) 
for the amount of transmitter released per unit time implies that the original incoming weighted signal zij * Si is distorted both by depletion of the presynaptic transmitter u ij and by the activity level xj of the postsynaptic cell.
 If these two nonlinearities are significant, the net signal in the ijth pathway depends JOINTLY on the MAXIMAL WEIGHTED SIGNAL zij * Si; the PRIOR ACTIVITY in the pathway, as reflected in the AMOUNT OF DEPLETION OF THE TRANSMITTER u,i; and the IMMEDIATE CONTEXT in which the signal is sent, as reflected in the TARGET CELL ACTIVITY xj.
 In particular, ONCE ACTIVITY IN A POSTSYNAPTIC CELL BECOMES LARGE, THIS ACTIVITY DOMINATES THE TRANSMITTER RELEASE RATE, via the term f(xj) in (15).

 In other words, although linear filtering properties initially determine the small-amplitude activity pattern of the target field Fc, once intrafield feedback amplifies and contrast-enhances the postsynaptic activity xj (Figure 13b) it plays a major role in determining the amount of released transmitter uij (Figure 14). In particular, the POSTSYNAPTIC ACTIVITY PATTERN across the field Fc that represents the recognition code (Figure 13b) is IMPARTED TO THE PATTERN OF RELEASED TRANSMITTER (Figure 14), which THEN ALSO REPRESENTS THE RECOGNITION CODE, rather than the initial filtered pattern S dot z i.

13. SYSTEM DYNAMICS DURING RESET:  INACTIVATION OF BOUND TRANSMITTER CHANNELS
The dynamics of transmitter release implied by the ART Search Hypothesis 1 can be used to implement the reset process, by postulating the ART Search Hypothesis 2: The nonspecific RESET SIGNAL QUICKLY INACTIVATES POSTSYNAPTIC MEMBRANE CHANNELS at which transmitter is bound (Figure 15). The RESET SIGNAL IN EQNS (5) AND (6) may be interpreted as assignment of a LARGE VALUE TO THE INACTIVATION RATE in a manner analogous to the action of a neuromodulator (Figure 9). Inhibition of postsynaptic nodes breaks the strong intrafield feedback loops that implement ART 2 and ART 3 matching and contrast-enhancement (eqn (3) or (6)).
Let us now examine system dynamics FOLLOWING TRANSMITTER INACTIVATION. The pattern of released transmitter can be viewed as a representation of the postsynaptic recognition code. The arrival of a reset signal implies that some part of the system has judged this code to be erroneous, according to some criterion.

The ART Search Hypothesis 1 implies that the largest concentrations of bound extracettular transmitter are adjacent to the nodes which most actively represent this erroneous code. 
The ART Search Hypothesis 2 therefore implies that the RESET PROCESS SELECTIVELY REMOVES TRANSMITTER FROM PATHWAYS LEADING TO THE ERRONEOUS REPRESENTATION. 
After the reset wave has acted, the SYSTEM IS BIASED AGAINST ACTIVATION OF THE SAME NODES, or features, in the next time interval: 
Whereas the transmitter signal pattern S dot uj originally sent to target nodes at times t = 0+  was proportional to S  dot zj, as in eqn (12), the transmitter signal pattern S dot ui AFTER THE RESET EVENT is no longer proportional to S dot zi. Instead, it is SELECTIVELY BIASED AGAINST those features that were previously active (Figure 16). 
The new signal pattern S dot uj WILL LEAD TO SELECTION OF ANOTHER CONTRAST-ENHANCED REPRESENTATION, which may or may not then be reset. This search process continues until an acceptable match is found, possibly through the selectioof a previously inactive representation.

[FIGURE 14. The ART Search Hypothesis I implies that large amounts of transmitter (uij) are RELEASED ONLY TO ONLY ADJACENT TO POSTSYNAPTIC ODES WITH LARGE-AMPLITUDE ACTIVITY (xj). Competition within the postynaptic field therefore transforms the initial low-amplitude distributed patter of released and bound transmitter into a large-amplitude contrast-enhanced pattern.]

[FIGURE 15: The ART Search Hypothesis 2 specifies a high rate of inactivation of bound transmitter following a reset signal. Postsynaptic action of the nonspecific reset signal is similar to that of a neuromodulator.]

14. PARAMETRIC ROBUSTNESS OF THE SEARCH PROCESS
This search process is relatively easy to implement, requiring no new nodes or pathways beyond those already present in ART 2 modules. It is also robust, since it does not require tricky timing or calibration. 

How the process copes with a typical slow learning situation is illustrated in Figure 17. With slow learning, an input can select and begin to train a new category so that the adaptive weights correspond to a perfect pattern match during learning. However, the  INPUT MAY NOT BE ON LONG ENOUGH FOR THE ADAPTIVE WEIGHTS TO BECOME VERY LARGE. That input may later activate a different category node WHOSE WEIGHTS ARE LARGE BUT WHOSE VECTOR OF ADAPTIVE WEIGHTS FORMS A POORER MATCH than the original, smaller weights. 

Figure 17a shows such a typical filtered signal pattern S dot zj.  During the initial processing interval (t = 0+) the transmitted signal S dot uj and the postsynaptic activity xj are proportional to S dot zj. Suppose that the weights zij in pathways leading to the Jth node are large, but that the vector pattern Zj is NOT AN ADEQUATE MATCH for the signal pattern S according to the vigilance criterion. Also suppose that dynamics in the target field F, lead to a "choice" following competitive contrast-enhancement (Figure 17b) and that the chosen node J represents a category. 
LARGE AMOUNTS OF TRANSMITTER will thus be released from synapses adjacent to node J, but not from synapses adjacent to other nodes. The RESET SIGNAL will then selectively inactivate transmitter at postsynaptic sites adjacent to the Jth node. Following such a reset wave, THE NEW SIGNAL pattern S dot uj will be BIASED AGAINST the Jth node relative to the original pattern. 
However, it could happen that the TIME INTERVAL PRIOR TO THE RESET SIGNAL is so brief that ONLY A SMALL FRACTION OF AVAILABLE TRANSMITTER IS RELEASED. Then S dot ul COULD STILL BE LARGE RELATIVE TO A "CORRECT" S dot u, after reset occurs (Figure 17c).
 If this were to occur, the Jth node WOULD SIMPLY BE CHOSEN AGAIN, THEN RESET AGAIN, LEADING TO AN ACCUMULATING BIAS against that choice in the next time interval. This process could CONTINUE UNTIL ENOUGH TRANSMITTER VII IS INACTIVATED TO ALLOW ANOTHER NODE, with smaller weights zij but a better pattern match, to win the competition. Simulations of such a reset sequence are illustrated in Figures 23-26.

15. SUMMARY OF SYSTEM DYNAMICS DURING A MISMATCH-RESET CYCLE
Figure 18 summarizes system dynamics of the ART search model during a single input presentation. Initially, the transmitted signal pattern S dot uj, as well as the postsynaptic activity xj, are proportional to the weighted signal pattern S dot zj of the linear filter. The postsynaptic activity pattern is then contrast-enhanced due to the internal competitive dynamics of the target field. 
The ART Search Hypothesis 1 implies that the transmitter release rate is greatly amplified in proportion to the level of postsynaptic activity. 
A subsequent RESET SIGNAL selectively inactivates transmitter in those pathways that caused an error. Following the reset wave, the new signal S  dot uj is no longer proportional to S dot zj but is, rather, BIASED AGAINST THE PREVIOUSLY ACTIVE representation. A SERIES  OF  RESET EVENTS ensue until an adequate match or a new category is found. 
Learning occurs on a time scale that is long relative to that of the search process.

[FIGURE 18. ART Search Hypotheses I and 2 implement computations to carry out search in an ART system. Input reset employs the same mechanisms as mismatch reset, initiating search when the input pattern changes significantly.]


16. AUTOMATIC STM RESET BY REALTIME INPUT SEQUENCES
The ART 3 architecture serves other functions as well as implementing the mismatch-reset-search cycle. In particular, it allows an ART system to DISPENSE with additional processes to reset STM at onset or offset of an input pattern. 
The representation of input patterns as a sequence, I1, I2, I3. ... corresponds to the ASSUMPTION THAT EACH INPUT IS CONSTANT FOR A FIXED TIME INTERVAL. 
In practice, an INPUT VECTOR I(T) MAY VARY CONTINUOUSLY THROUGH TIME. The input need never be constant over an interval, and there MAY BE NO TEMPORAL MARKER to signal OFFSET or ONSET of "an input pattern" per se. 

Furthermore, feedback loops within a field or between two fields CAN MAINTAIN LARGE AMPLITUDE ACTIVITY EVEN WHEN I(t) = 0. 

ADAPTIVE RESONANCE develops ONLY when activity patterns across fields are AMPLIFIED BY SUCH FEEDBACK LOOPS AND REMAIN STABLE FOR A SUFFICIENTLY LONG TIME TO ENABLE ADAPTIVE WEIGHT CHANGES TO OCCUR (Grossberg, 1976b, 1982a). 

In particular, NO RESET WAVES ARE TRIGGERED DURING A RESONANT EVENT. The ART reset system FUNCTIONALLY DEFINES THE ONSET OF A "NEW" INPUT as a time WHEN THE ORIENTING SUBSYSTEM EMITS A RESET WAVE. 
This occurs, for example, in the ART 2 module (Figure 3) when the ANGLE BETWEEN THE VECTORS I(t) and P(t) becomes so large that the norm of r(t) falls below the vigilance level p(t), thereby triggering a search for a new category representation. THIS IS CALLED AN INPUT RESET EVENT, to distinguish it from a 
MISMATCH RESET EVENT, which occurs while the BOTTOM-UP INPUT REMAINS NEARLY CONSTANT over a time interval but MISMATCHES THE TOP-DOWN EXPECTATION THAT IT HAS ELICITED FROM LEVEL F2 (Figure 2).
 This property OBVIATES THE NEED TO MECHANISTICALLY DEFINE THE PROCESSING OF INPUT ONSET OR OFFSET. 
The ART SEARCH HYPOTHESIS 3, which POSTULATES RESTORATION OF A RESTING STATE BETWEEN SUCCESSIVE INPUTS (Carpenter & Grossberg, 1989), is THUS NOT NEEDED.
Presynaptic transmitter may not be fully accumulated following an input reset event, just as it is not fully accumulated following a mismatch reset event. FOR BOTH TYPES OF RESET, THE ORIENTING SUBSYSTEM JUDGES THE ACTIVE CODE TO BE INCORRECT, AT THE PRESENT LEVEL OF VIGILANCE, and the system continues to search until it finds an acceptable representation.

17. REINFORCEMENT FEEDBACK
The mechanisms described thus far for STM reset are part of the recognition learning circuit of ART 3. Recognition learning is, however, only one of several processes whereby an intelligent system can learn a correct solution to a problem. 
We have called RECOGNITION, REINFORCEMENT, AND RECALL the "3 R's" of neural network learning (Carpenter & Grossberg, 1988).

REINFORCEMENT, notably reward and punishment, provides additional information in the form of environmental feedback based on the success or failure of actions triggered by a recognition event. Reward and punishment calibrate whether the action has or has not satisfied internal needs, which in the biological case include hunger, thirst, sex. and pain reduction, but may in machine applications include a wide variety of internal cost functions.
 Reinforcement can shift attention to focus upon those recognition codes whose activation promises to satisfy internal needs based on past experience. A model to describe this aspect of reinforcement learning was described in Grossberg (1982a, 1982b, 1984: reprinted in Grossberg, 1987a) and was supported by computer simulations in Grossberg and Levine (1987; reprinted in Grossbcrg, 1988). GET REFS.

 An attention shift due to reinforcement can also alter the structure and learning of recognition codes by amplifying (or suppressing) the STM activations, and hence the adjacent adaptive weights, of feature detectors that are active during positive (or negative) reinforcement. 
A reset wave may also be used to modify the pattern of STM activation in response to reinforcement. For example, both GREEN AND YELLOW BANANAS  may be recognized as part of a single recognition category until reinforcement signals, contingent upon eating the bananas, differentiate them into separate categories. 

Within ART 3, such a REINFORCEMENT SIGNAL can alter the course of recognition learning by causing a RESET EVENT. The reset event may override a bias in either the learned path weights (Figure 19) or in the input strengths (Figure 20) that could otherwise prevent a correct classification from being learned. For example, both green and yellow bananas may initially be coded in the same recognition  category because features that code object shape (e.g, pathway A in Figures 19 and 20) prevent features that code object color (e.g., pathway B in Figures 19 and 20) from being processed in STM. Reset waves triggered by reinforcement feedback can progressively weaken the STM activities of these shape features until both shape and color features can simultaneously be processed, and thereby incorporated into different recognition codes for green bananas and yellow bananas.
In technical applications, SUCH A RESET WAVE CAN BE IMPLEMENTED AS A DIRECT SIGNAL FROM AN INTERNAL REPRESENTATION OF A PUNISHING EVENT. The effect of the reset wave is to modify the spatial pattern of STM activation whose read-out into an overt action led to the punishing event. The adaptive weights, or LTM traces, that input to these STM activations are then indirectly altered by an amount that reflects the new STM activation pattern. Such a reinforcement scheme differs from the competitive learning scheme described by Kohonen (1984, p. 200), in which reinforcement acts directly, and by an equal amount, on all adaptive weights that lead to an incorrect classification. 
REINFORCEMENT MAY ALSO ACT BY CHANGING THE LEVEL OF VIGILANCE (Carpenter & Grossberg, 1987a, 1987b). For example, if a punishing event increases the vigilance parameter, then mismatches that were tolerated before will lead to a search for another recognition code. Such a code can help to distinguish pattern differences that were previously considered too small to be significant. 
Such a role for reinforcement is illustrated by computer simulations in Figures 25- 28. 
All three types of reaction to reinforcement feedback may be useful in applications. The CHANGE IN VIGILANCE alters the overall sensitivity of the system to pattern differences. The SHIFT IN ATTENTION and the RESET OF ACTIVE FEATURES can help to overcome prior coding biases that may be maladaptive in novel contexts. 

18. NOTATION FOR HIERARCHIES
Table 1 and Figure 21 illustrate notation suitable for an ART hierarchy with any number of fields Fa Fb Fc . . . . . This notation can also be adapted for related neural networks and algorithmic computer simulation. Each STM variable is indexed by its field, layer, and node number. 
Within a layer, x denotes the activity of a node receiving inputs from other layers, while y denotes the (normalized) activity of a node that sends signals to other layers.  For example, xi-a-2 denotes activity at the ith input node in layer 2 of field Fa (i = 1 . . . n,) and yj-a-2  denotes activity of the corresponding output node. 
PARAMETERS are also indexed by field (p1a, p2a  . . . . ), 
as are signal functions (ga). 
Variable ri-b denotes activity of the ith RESET NODE of field Fb, and pb is the corresponding vigilance parameter.
Variable z denotes an adaptive weight or LTM trace. For example, z~ '~ is the weight in the bottom up pathway from the ith node of field Fb to the jth node of field F,.. Variables u ~ and v~ ~ denote the corresponding presynaptic and bound transmitter
quantities, respectively. Variables for the top-down pathways are zji-cb, uji-cb, and vji-cb.  Complete simulation equations are specified in Section 26.

19. TRADE,OFF BE~EEN WEIGHT SIZE AND PAI'TERN MATCH
The simulations in Sections 20-24 illustrate the dynamics of search in the ART 3 system shown in Figure 21. The simulation time scale is assumed to be short relative to the time scale of learning, so all adaptive weights zij-bc and zji-cb are held constant. The WEIGHTS ARE CHOSEN, HOWEVER, TO ILLUSTRATE A PROBLEM  that can arise with slow learning or in any other situation in which WEIGHT VECTORS ARE NOT NORMALIZED AT ALL TIMES. Namely, a category whose weight vector only partially matches the input vector may become active because its weights are large, This can prevent initial selection of another category whose weight vector matches the input vector but whose weight magnitudes are small due, say, to a brief prior learning interval. The search process allows the ART 3 system to reject an initial selection with large weights and partial pattern match, and then to activate a category with smaller weights and a better pattern match. 
As in ART 2. when weights are very small (nodes j = 6, 7 . . . . . Figure 22)  the ART system tolerates poor pattern matches to allow new categories to become established. During learning, the weights can become larger. The larger the weights, the more sensitive the ART system is to pattern mismatch (Carpenter  & Grossberg, 1987b). 
Figure 22 illustrates the TRADE-OFF BETWEEN WEIGHT SIZE AND PATTERN MATCH in the system used in the simulations.
In Figures 22a and 22b, vector S illustrates the STM pattern stored in Fa, and sent from Fa to Fb when an input vector I is held constant. The Si values were obtained by presenting to Fa an input function I with Ii linearly decreasing function of i. Vector S is also stored in Fb, as long as Fc remains inactive. Initially, S is the signal vector in the bottom up pathways from Fb to Fc. 
In Figure 22a . S1 :> S2> . . > S15 ;for i = 6,7 . . 15(= na  = nb), Si is small. Each vector z1, z2, z3, and z4, plotted in columns within the square region of Figure 22a, partially matches the signal vector S. These weights are significantly larger than the weights of vector z5.  However, z5 is a perfect match to S in the sense that the angle between the two vectors is 0:
                           cos(S, z5) = l.                                           (16) 

The relationship
                          S dot zj = ||S||  * ||zj|| * cos(S, zi)                       (1'7)
implies a trade-off between weight size, as measured by the length ItzjH of zj, and pattern match, as measured by the angle between S and z r If the initial signal from Fh to F, is proportional to S dot zj, as in (13), then the matched node (j = 5) may receive a net signal that is smaller than signals to other nodes. 
In fact, in Figure 22a, 
                           S dot z1>S dot z2>S dot z3> S dot z4>. . . .                             (18)
Figure 22b shows a signal vector S that is parallel to the weight vector zi.

20. ART 3 SIMULATIONS: MISMATCH RESET AND INPUT RESET OF STM CHOICES
The computer simulations summarized in Figures 23-26 use the inputs described in Figure 22 to illustrate the search process in an ART 3 system. In these simulations, the Fc competition parameters were chosen to make a choice; hence, only the node receiving the largest filtered input from Fb is stored in STM.
The signal function of Fc caused the STM field to make a choice. In Figure 27, a different signal function at Fc similar to the one used in Fa and Fb, illustrates how the search process reorganizes a distributed recognition code. 
The simulations show how, with high vigilance, the ART search process rapidly causes a SERIES OF MISMATCH RESETS that alter the transmitter  vectors u1, u 2 , . . , UNTIL S dot u5 becomes maximal. Once node j = 5 becomes active in STM it amplifies transmitter release. SINCE THE PATTERN MATCH IS PERFECT, NO FURTHER RESET OCCURS while Input 1 (Figure 22a) remains on. Input reset is illustrated following an abrupt or gradual switch to Input 2 (Figure 22b).

Each simulation figure ILLUSTRATES THREE SYSTEM VARIABLES as they evolve through time. The TIME AXIS (t) runs from the top to the bottom of the square. A VECTOR PATTERN, indexed by i or j, is plotted horizontally at each fixed time. Within each square, the VALUE OF A VARIABLE at each time is represented by the length of a side of a square centered at that point.
 In each figure, part (a) plots yj-c1, the normalized STM variables at layer 1 of field F,.. 
Part (b) plots  SUMi uij-bc, the total amount of transmitter released, bottom-up, in paths from all Fb nodes to the jth Fc node. 
Part (c) plots  SUMj uji-cb, the total amount of transmitter released, top-down, in paths from all F, nodes to the ith Fh node. 
The ART Search Hypothesis 1 implies that the net bottom-up transmitter pattern in part (b) reflects the STM pattern of Fc  in part (a); and that the net top-down transmitter pattern in part (c) reflects the STM pattern of Fb. 
In Figure 23, the vigilance parameter is high and fixed at the value p = .98. (19) 
For 0 <= t < .8, the input (Figure 22a) is constant.  The high vigilance level induces a sequence of mismatch resets, alternating among the category nodes j = 1, 2, and 4 (Figure 23a), each of which receives an initial input larger than the input to node j = 5
(Figure 22a). 
At t = .215, the Fc nodej = 5 is selected by the search process (Figure 23a). It remains active until t = .8. Then, the input from Fa is changed to a new pattern (Figure 22b). The mismatch between the new STM pattern at Fa and the old reverberating STM pattern at Fb leads to an input reset (Figures 18 and 23). 
The ART Search Hypothesis 2 implies that bound transmitter is inactivated and the STM feedback loops in Fb and Fc are thereby inhibited. The new input pattern immediately activates its category node j = 1, despite some previous depletion at that node (Figure 23a). Large quantities of transmitter are released and bound only after STM resonance is established. 
In Figure 23b, large quantities of bottom-up transmitter are released at the Fc node j = 5 in the time interval .215 < t < .8, and at node j = 1 in the time interval .8 < t < 1. In Figure 23c. the pattern of top-down bound transmitter reflects the resonating matched STM pattern at Fb due to Input 1 at times .215 < t < .8 and due to Input 2 at times .8 < t < 1.

21. SEARCH TIME INVARIANCE AT DIFFERENT VIGILANCE VALUES

Figure 24 shows the dynamics of the same system as in Figure 23 but at the lower vigilance value p =.94.          (20) 
The Fc node j = 5 becomes active slightly sooner
(t = .19. Figure 24a) than it does in Figure 23a, where p = .98. At a lower vigilance, more transmitter needs to be released before the system reacts to a mismatch so that each "erroneous" category node is active for a longer time interval than at higher vigilance. When p = .98 (Figure 23b), node j = 1 is searched five times. When p = .94 (Figure 24b), node j = 1 is searched only three times, but more transmitter is released during each activation/reset cycle than at comparable points in Figure 23b. Inactivation of this extra released transmitter approximately balances the longer times to reset. Hence, the total search time remains approximately constant over a wide range of vigilance parameters. In the present instance, the nonlinearities of transmitter release terminate the search slightly sooner at lower vigilance.
Figure 24a illustrates another effect of lower vigilance:
the system's ability to tolerate larger mismatches without causing a reset. When the input changes at t = .8, the mismatch between the input pattern at F, and the resonating pattern at Fh is not great enough to cause an input reset. Despite bottom up input only to nodes i = 1, 2, the strong resonating pattern at nodes i = 1 . . . . . 5 maintains itself in STM at Fh (Figure 24c).

22. REINFORCEMENT RESET
In Figure 25, vigilance is initially set at value 
                                             p = .9,                                               (21)
in the time interval 0 < t < . 1. At this low vigilance level, the STM pattern of Fb does not experience a mismatch reset series. 
Node j = 1 is chosen and resonance immediately ensues (Figure 25a), 
as is also reflected in the amplification of transmitter release (Figure 25b). 
The simulation illustrates a case where this choice of category leads to external consequences, including REINFORCEMENT (Section 17),  that feed back to the ART 3 module. THIS REINFORCEMENT TEACHING SIGNAL IS ASSUMED TO CAUSE VIGILANCE TO INCREASE TO THE VALUE p = .98 (22)
for times t >=  .1. This change triggers a search that ends at node j = 5, at time t = .19. Note that, as in Figure 24, enhanced depletion of transmitter at j = 1 shortens the total search time. In Figure 23, where p also equals .98, the searehintervat has length .215: in Figure 25, the search interval has length .09, and the system never again activates node j = 1 during search.

23. INPUT  HYSTERESIS SIMULATION
The simulation illustrated in Figttte 26 is nearly the same as in Figure 25, with a = .9 for O_< t < .t and p = .98 for t >. 1. However, at t = .8, Input 1 starts to be SLOWLY DEFORMED INTO INPUT 2,rather than being SUDDENLY SWITCHED, as in Figure 25. 
The Fa to Fb INPUT VECTOR BECOMES A CONVEX COMBINATION of Input 1 and Input 2 that starts as Input 1 (t <= .8) and is linearly shifted to Input 2 (t -> 1.7). Despite the gradually shifting input, node j = 5 remains active until t = 1.28. 
Then an INPUT RESET immediately leads to activation of node j = 1, whose weight vector matches Input 2. 
Competition in the category representation field F, causes a HISTORY-DEPENDENT CHOICE OF ONE CATEGORY OR THE OTHER, NOT A CONVEX COMBINATION OF THE TWO.

24. DISTRIBUTED CODE SIMULATION
Issues of learning and code interpretation are subtle and complex when a code is distributed. However, the ART 3 search mechanism translates immediately into this context. The simulation in Figure 27 illustrates how search operates on a distributed code. The only difference between the ART 3 system used for these simulations and the one used for Figures 23- 26 is in the signal function at Fc. 
 In Figures 23-26, A CHOICE IS ALWAYS MADE AT FIELD Fc.
The signal function for Figure 26 is, like that at Fa  and Fb, piecewise linear: 0 below a threshold, linear above. With its FAIRLY HIGH THRESHOLD, THIS SIGNAL FUNCTION COMPRESSES THE INPUT PATTERN; but the compression is NOT SO EXTREME so as to lead inevitably to choice in STM. 

DISTRIBUTED CODE STM activity is shown in Figure 27a. At a given time MORE THAN ONE ACTIVE NODE MAY REPRESENT A CATEGORY (2.6 < t < 7), or one node may be chosen (7.7 < t =< 9).

25. ALTERNATIVE ART 3 MODEL SIMULATION
ART 3 systems satisfy the small number of design constraints described above. In addition, ART 3 satisfies the ART 2 stability constraints (Carpenter & Grossberg, 1987b). For example, top-down signals need to be an order of magnitude larger than bottomup signals, all other things being equal, as illustrated below by (24) and parameters Pl and P2 in Table 4 and eqns (31) and (34). At least some of the STM  fields need to be competitive networks. However, many versions of the ART systems exist within these boundaries. 
A simulation of one such system is illustrated in Figure 28, which duplicates the conditions on p and input patterns of Figure 25. However. the system that generated Figure 28 uses a different version of the ART 3 STM field Fc than the one described in Section 26. In particular, .in the STM equation (3), B > 0. STM nodes can thus be hyperpolarized, so that xj < 0, by intrafietd inhibitory inputs. The transmitter release function f(xj) (eqn (9)) equals 0 when xj is sufficiently hyperpolarized. 
The system of Figure 28 thus has the property that transmitter release can be terminated at nodes that become inactive during the STM competition. 
Since f(0) needs to be positive to allow transmitter release to begin (Figure 12), low-level transmitter release by nodes without significant STM activity is unavoidable if nodes cannot be hyperpolarized. 
Figure 28 shows that a competitive STM field with HYPERPOLARIZATION GIVES SEARCH AND RESONANCE RESULTS SIMILAR TO THOSE OF THE OTHER SIMULATIONS. 
SIMILARLY, CONSIDERABLE VARIATIONS IN PARAMETERS ALSO GIVE SIMILAR RESULTS.


26. SIMULATION EQUATIONS ====================================
Simulation equations are described in an algorithmic form to indicate the steps followed in the computer program that generated Figures 23-27.

Time Scale
The SIMULATION TIME SCALE IS FIXED BY SETTING THE RATE OF TRANSMITTER ACCUMULATION equal to 1. The intrafield STM rate is assumed to be significantly faster and the LTM rate significantly slower. Accordingly, STM equations ARE ITERATED SEVERAL TIMES EACH TIME STEP AND LTM WEIGHTS ARE HELD CONSTANT. The simulation time step is  At = .005. (23)

Integration Method
Transmitter variables u and u are integrated by firstorder approximation (Euler's method). The IMSL Gear package gives essentially identical solutions but
requires more computer time.

LTM WEIGHTS ----------------------------------------------------------------------------------
The bottom-up LTM weights zij-bc illustrated in Figure 22 are specified in Table 2. At "uncommitted" nodes (j >= 6) zij-bc = 0.001. Top-down LTM weights zji-cb are constant multiples of corresponding zij-bc weights:
                                        zji-cb = 10 *  zij-bc. (24)
This choice of LTM weights approximates a typical state of an ART system undergoing slow learning. Weights do not necessarily reach equilibrium on each presentation, but while the Jth Fc node is active, 
                                         zji-cb --->  xi-b3          (25)
      and
                                         zij-bc ----> Si-b3          (26)
Given the parameters specified below, as STM and LTM variables approach equilibrium,
                                         xi-b3 aprox= 10 * Si-b3  (27)
Equations (25)-(27) imply that eqn (24) is a good approximation of a typical weight distribution.

INITIAL VALUES --------------------------------------------------------------------------
Initially, 
                                          uij-bc(0) = zij-bc          (28)
and
                                           uji-cb(0) = zji-cb         (29)

>>> ALL OTHER INITIAL VALUES ARE   0. [me:  .0001 to avoid div by 0]

INPUT VALUES ---------------------------------------------------------------------------
The Fb input values (Si-a3) are specified in Table 3.
All simulations start with Input 1. Several of the simulations switch to Input 2 either with A JUMP OR GRADUALLY. Input 1 values are obtained by presenting a linear, decreasing function Ii to Fa. Input 2 values are obtained by setting I1 = I2 = 1 and Ii = 0 (i >= 3).
Implicit in this formulation is the assumption that a changing input vector I can register itself at Fa. This requires that STM at Fa be frequently "reset." Otherwise, new values of Ii may go unnoticed, due to strong feedback within Fa. Feedback within Fb allows the STM to maintain resonance even with fluctuating amplitudes at Fa.

STM EQUATIONS xxxx-------------------------------------------------------------------------

EXCEPT DURING RESET, equations used to generate the STM values for Figures 23-27 ARE SIMILAR TO THE ART 2 EQUATIONS (Carpenter & Grossberg, 1987b). Dynamics of the fields Fa, Fb, and Fc. are HOMOLOGOUS, as shown in Figure 21. Steady-state variables for the field Fb, when the reset signal equals 0, are given by eqns (31)-(36).
 Similar equations hold for fields Fa and Fc.

 LAYER 1, INPUT VARIABLE
                             e * dxi-b1/dt =  -xj-b1 +  Si-a3 + p1b * Si-b2      (30)
In steady state,
                             xi-bi approx=  Si-a3  +  p1b * Si-b2                     (31)

Table 4 specifies parameter p1b, p2b, ...  values and the signal function
                                    gb(yi-b1)  =  Sib1                                           (32)
for layers L = 1, 2, 3. 
Equation (31) is similar to the simplified STM eqn (6), with xi-b1 equal to the sum of an interfietd input (Si-a3) and an intrafield  input (p1b * Si-b2). 

LAYER 1, OUTPUT VARIABLE
                            yi-b1  approx=  xi-b1 /  p3b + ||x-b1||                                (33)

LAYER 2. INPUT VARIABLE
                           xi-b2  approx=  Si-b1  +  p2b * Si-b3                               (34)

LAYER 2. OUTPUT VARIABLe
                           yib2 approx=  xi-b2 /  pxb  _  ||xb2||                               (35)

LAYER 3, INPUT VARIABLE
                           xi-b3 approx=  Si-b2  +  p4c * SUMi  vji-cb                   (36)

LAYER 3, OUTPUT VARIABLE
                           yi-b3 approx=  xi-b3  /   pb3b  +  ||xb3||                          (37)

NORMALIZATION of the output variables in eqns (33), (35), and (37) accomplishes two goals. First, since the nonlinear signal function gb in eqn (32) has a fixed threshold, normalization is needed to achieve orderly pattern transformations under variable processing loads. This goal could have been reached with other norms, such as the LInput norm (||x||-=  SUMi xi). The second goal of normalization is to allow the PATTERNS TO HAVE DIRECT ACCESS TO CATEGORY representations, without search, after the code has stabilized (Carpenter & Grossberg, 1987a, 1987b). Equations (13) and (17) together tie the Euclidean norm to direct access in the present model. If direct access is not needed, or if another measure of similarity of vectors is used, the Euclidean norm may be replaced by LInput  or another norm.

TRANSMITTER EQUATIONS --------------------------------------------------------------
When the reset signal equals O, levels of presynaptic and bound transmitter are governed by equations of the form (1) and (5). as follows.

Presynaptic transmitter, Fb ---> Fc
                   duij-bc/dt  =  (zij-bc  -  uij-bc)  -  uij-bc * p5c * (xi-c1  +  p6c) * Sib3    (38)

Bound transmitter,  Fb ---->  Fc
                   dvij-bc/dt  =  -vij-bc  +  Uij-bc * p5c * (xi-c1  +  p6c) * Sib3     (39)

Presynaptic transmitter, Fc ----> Fb
                  duji-cb/dt  =  (zji-cb)  =  uji-cb * p5b * (xi-b3  +  p6b) * Sic1    (40)

Bound transmitter, Fc ------> Fb
                  dvji-cb/dt  =  -vji-cb  +  Uji-cb * p5b * (xi-b3  +  p6b) * Sic1     (41)

;;me RELATION OF U and V to Z
Note that eqns (38) and (39) imply that
                  uij-bc  +  vij-bc --->  zij-bc      (42)

and eqns (40) and (41) imply that
                 uji-cb  + vji-cb ------>  zji-cb     (43)

RESET EQUATIONS --------------------------------------------------------------------------
Reset occurs when patterns active at F~ and Fh fail to match according to the criterion set by the vigilance parameter. 
In Figure 21,
                rib approx=  yi-a2  +  yi-b2 / p3a  +  ||ya2||  +  ||yb2||      (44)
Reset occurs if  where
               ||rb||  <  pb                                   (45)

               0 <  pb  <  1                                (46)

As in eqns (5) and (6), the EFFECT OF A LARGE RESET SIGNAL is approximated by setting input variables xi-b1, xi-b3, xj-c1, xj-c3 and bound transmitter variables vij-bc, vji-cb EQUAL TO 0.

BBB
ITERATION STEPS ----------------------------------------------------------------------------
Steps 1-7 outline the iteration scheme in the computer
program used to generate the simulations.
Step 1. t--> t + Delta-t.
Step 2. Set p and Si-a3 values.
Step 3. Compute rib  and check for reset.
Step 4. Iterate STM equations Fb,Fc five times, setting variables to 0 at reset.
Step 5. Iterate transmitter eqns (38)-(41).
Step 6. Compute sums SUMi vij-bc  and  SUMj vji-cb
Step 7. Return to Step 1.



_____________________________________________________________
                                                            TABLE 4
   ;;SSSS COMPARE PARAMETERS BELOW TO MY ART3
                                           PARAMETERS
     p1a  = p1b = p1c = 10.0  ;; Mine:  *p1-all = 10.0
     p2a  = p2b = p2c = 10.0  ;; *p2-all = 10.0
     p3a  = p3b = p3c = 0.0001 ;;*p3-all = 0.0001
     p4c =  0.9                           ;; *p4-3 = 0.9
     p5b = p5c = 0.1                 ;; *p5-all = 0.1
     p6b = p6c = 1.0                 ;; *p6-all = 1.0

                                 SIGNAL FUNCTIONS GA, GB, GC
                                          Signal Function Parameters
     Fa, Fb DISTRIBUTED-all F1,F2 are distributed??
        p7a = p7b = 0.0              ;;*pd7-12  = 0.0001
        p8a = p8b = 0.3              ;;*pd8-12  = 0.3

      Fc DISTRIBUTED
         p7c  =  0.0                     ;;*pd7-3  = 0.0001
         p8c  =  0.4                     ;;*pd8-3  = 0.4

     Fc CHOICE
        p7c  =  1/ SqRt nc          ;; ?? *pc7-3  =  (/ (sqrt nc)) ;;is nc num F3 nodes? *n-outputs?
        p8c  =  0.2                      ;; *pc8-3= 0.2

                                         Signal Functions [look different from ART2 g & sigmoid 
      DISTRIBUTED
          g (w)  =  {0                          ;if w <= p7  +  p8}
                         {(w  -  p7) / p8      ;if w  >  p7  +  p8}
   
       CHOICE
          g (w)  =  {0                                ;if w <=  p7}
                         { (w  -  p7 / p8) Sq     ;if w  >   p7 }
NOTE: I replaced ART2 sigmoid function contents = x-activity or 0 if > theta 
with above


27. CONCLUSION
In conclusion, we have seen that a functional analysis of parallel search within a hierarchical ART architecture can exploit processes taking place at the chemical synapse as a rich source of robust designs with natural realizations. Conversely, such a neural network analysis embeds model synapses into a processing context that can help to give functional and behavioral meaning to mechanisms defined at the intracellular, biophysical, and biochemical levels.





|#