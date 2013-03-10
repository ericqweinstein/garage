; Project Euler Problem Number Seven:
;
; What is the 10,001st prime number?

; Java interop: sometimes it's awesome
(defn prime? [n]
  (.isProbablePrime (BigInteger/valueOf n) 10))

(defn problemSeven [n]
  (nth (filter prime? (iterate inc 1)) n))

; (problemSeven 10000) ==> 104743

