; Project Euler Problem Number Three:
;
; What is the largest prime factor
; of the number 600851475143?

(require '[clojure.math.numeric-tower :as math])

; Utility functions
(defn factor? [x y]
  (zero? (mod x y)))

(defn factors [number]
  (concat (filter #(factor? number %) (range 1 (math/floor (math/sqrt number)))) [number]))

(defn prime? [number]
  (= (count (factors number)) 2))

(defn problemThree [number]
  (reduce max (filter #(prime? %) (factors number))))

; (problemThree 600851475143) ==> 6857

