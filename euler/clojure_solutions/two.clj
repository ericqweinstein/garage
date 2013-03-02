; Project Euler Problem Number Two:
;
; Find the sum of the even-valued terms of
; the Fibonacci sequence below four million.

; Function for calculating Fibonacci numbers
(defn fib [a b]
  (lazy-cat [a] (fib b (+ a b))))

(defn problemTwo [n]
  (reduce + (for [f (fib 1 2) :when (zero? (mod f 2)) :while (< f n)] f)))

; (problemTwo 4000000) ==> 4613732

