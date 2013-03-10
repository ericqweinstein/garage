; Project Euler Problem Number Ten:
;
; Find the sum of all prime
; numbers below two million.

; Java interop to the rescue again
(defn prime? [n]
  (.isProbablePrime (BigInteger/valueOf n) 10))

(defn problemTen [limit]
  (reduce + (filter prime? (range 2 limit))))

; (problemTen 2000000) ==> 142913828922

