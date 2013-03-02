; Project Euler Problem Number Six:
;
; What is the difference between the
; sum of the squares and the square
; of the sums for the numbers 1 - 100?

; Define a square function
(defn square [number]
  (* number number))

(defn problemSix []
  (- (square (reduce + (range 101))) (reduce + (map square(range 101)))))

; (problemSix) ==> 25164150

