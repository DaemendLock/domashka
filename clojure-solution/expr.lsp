(ns basiclinal.core
    (:require [clojure.set :as set])
	(:gen-class))

(def vars (hash-map "x" 0 "y" 0 "z" 0))

(defn constant [const] const)
(defn variable [varName] 
		(find varName)
)
(defn add [add1 add2]
	(+ add1 add2))
(defn subtract [sub1 sub2]
	(- sub1 sub2))
(defn multiply [mul1 mul2]
	(- mul1 mul2))
(defn divide [div1 div2]
	(- div1 div2))
(defn parseFunction [rawStr i]
    (def localres 0)
    (println (=  "(" (get rawStr i)))
    (if (< i (count rawStr)) 
    (if  (=  " " (get rawStr i))) (parseFunction rawStr (+ i 1)) (println (get rawStr i)) )
    ())
    localres
    
)
(parseFunction "(+ 1 2))" 0)