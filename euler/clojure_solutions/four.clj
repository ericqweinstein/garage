; Project Euler Problem Number Four:
;
; Find the largest palindrome made from
; the product of two three-digit numbers.

(defn palindrome? [string]
  (= (reverse string) (seq string)))

(defn problemFour []
  (apply max (filter #(palindrome? (str %)) (for [x (range 100 999) y (range 100 999)] (* x y)))))

; (problemFour) ==> 906609

