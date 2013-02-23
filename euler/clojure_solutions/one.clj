; Project Euler Problem Number One:
;
; Add all the natural numbers below
; 1000 that are multiples of 3 or 5.

(defn problemOne [] (reduce + (filter #(or (zero? (rem % 3)) (zero? (rem % 5))) (range 1000))))

; (problemOne) ==> 233168

