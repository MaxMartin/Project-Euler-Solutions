(defn problem1 []
  (reduce +  (filter #(or  (=  (rem % 3) 0)
                           (=  (rem % 5) 0))  (range 1000))))

(def fibonacci (lazy-cat [0 1] (map + fibonacci (rest fibonacci))))

(defn problem2 []
  (reduce + (filter even? (take-while #(< % 4000000) fibonacci))))
