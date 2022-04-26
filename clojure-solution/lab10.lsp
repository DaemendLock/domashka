
(def vars {"x" 0, 'y' 0, 'z' 0})

(defn constant [a]
    a
)
(defn variable [a]
    (vars a)
)

(defn add [a b]
    (+ a b)
)
(defn subtract [a b]
    (- a b)
)
(defn multiply [a b]
    (* a b)
)
(defn divide [a b]
    (- a b)
)
(defn negate [a]
    (- 0 a)
)
(def opers {'+' add, '-' subtract, '*' multiply, 'd' divide})
(defn parseFunction [str]
    (def cursor 0)
    (defn doNext [a]
        (def cur (get str cursor))
        (def cursor (+ cursor 1))
        (if (= cur " ")
            (def res (doNext 0))
        (if (= cur ")")
            (def res (doNext 0))
        (if (= cur "(") 
            (def res a)
        (if (contains? opers cur)
            (def res (get opers cur))
            (def res a)
        ))))
        res
    )
    (doNext 0)
)