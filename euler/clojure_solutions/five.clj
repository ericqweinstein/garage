; Project Euler Problem Number Five:
;
; What is the smallest number divisible
; by each of the numbers one to twenty?

; Who NAMES these things
(require '[clojure.math.numeric-tower :as math])

(defn problemFive [n]
  (reduce math/lcm (range 1 n)))

; (problemFive 20) ==> 232792560

