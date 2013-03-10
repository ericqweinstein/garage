; Project Euler Problem Number Nine:
;
; Find the product of the Pythagorean
; triple elements whose sum is 1,000.

; Utility functions
(defn square [n]
  (* n n))

(defn triple? [a, b, c]
  (= (+ (square a) (square b)) (square c)))

(defn problemNine [n]
  (for [a (range 1 n)
        b (range a n)
        c [(- 1000 a b)]
        :when (triple? a, b, c)]
   (list, a, b, c)))

; (problemNine 1000) ==> ((200 375 425))
;
; The question asks for the product, which is 31875000,
; but I'm more interested in the triple itself.
;
