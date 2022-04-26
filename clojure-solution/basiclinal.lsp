(ns expr.core
    (:require [clojure.set :as set])
	(:gen-class))

(defn getCol [mtx col]
    (def len (count (get mtx 0)))
    (def resCol (vector 0))
    (doseq [i mtx]
        (def resCol (conj resCol (get i col)))
    )
    (subvec resCol 1 (count resCol))
)

(defn v+ [& vectors]
    (if (= 1 (count vectors)) (def aVect (first vectors)) (def aVect vectors))
	(def aVec (vector 0))
	(def len (count (first aVect)))
	(dotimes [i len]
	    (def iter 0)
	    (doseq [cVec aVect]
	    	(def iter (+ iter (get cVec i))))
	    (def aVec (conj aVec iter)))
	(subvec aVec 1 (+ len 1)))

(defn v* [& vectors]
    (if (= 1 (count vectors)) (def mVect (first vectors)) (def mVect vectors))
	(def mVec (vector 0))
	(def len (count (first mVect)))
	(dotimes [i len]
	    (def iter 1)
	    (doseq [cVec mVect]
	    	(def iter (* iter (get cVec i))))
	    (def mVec (conj mVec iter)))
	(subvec mVec 1 (+ len 1)))	
	 
(defn v*s [vec multi]
	(def res (vector 0))
	(doseq [i vec]
	    (def res (conj res (* i multi)))
	)
	(subvec res 1 (count res))
)

(defn vect  [vecA vecB]
	(def res 0)
	(dotimes [i (count vecA)]
	    (def res (+ res (* (get vecA i) (get vecB i))))
	)
	res
)


(defn scalar [vecA vecB]
	(def scala 0)
	(def times (min (count vecA) (count vecB)))
	(dotimes [i times]
	    (def scala (+ scala (* (get vecA i) (get vecB i))))
	)
	scala
)	 

(defn v- [& sVec]
	(def resSub (v+ (rest sVec)))
	(def iter (vector 0))
	(def buf (first sVec))
	(dotimes [i (count buf)]
	    (def iter (conj iter (- (get buf i) (get resSub i))))
	)
	(subvec iter 1 (count iter))
)

(defn vd [& dVec]
	(def resDiv (v* (rest dVec)))
	(def iter (vector 0))
	(def buf (first dVec))
	(dotimes [i (count buf)]
	    (def iter (conj iter (/ (get buf i) (get resDiv i))))
	)
	(subvec iter 1 (count iter))
)


(defn m+ [aMtx1 aMtx2]
    (def mRes (vector 0))
	(dotimes [i (count aMtx1)]
		(def mRes (conj mRes (v+ (get aMtx1 i) (get aMtx2 i))))
	)
	(subvec mRes 1 (count mRes))
)
(defn m- [sMtx1 sMtx2]
    (def mRes (vector 0))
	(dotimes [i (count sMtx1)]
		(def mRes (conj mRes (v- (get sMtx1 i) (get sMtx2 i))))
	)
	(subvec mRes 1 (count mRes))
)
(defn m* [mMtx1 mMtx2]
    (def mRes (vector 0))
	(dotimes [i (count mMtx1)]
		(def mRes (conj mRes (v* (get mMtx1 i) (get mMtx2 i))))
	)
	(subvec mRes 1 (count mRes))
)
(defn md [dMtx1 dMtx2]
    (def mRes (vector 0))
	(dotimes [i (count dMtx1)]
		(def mRes (conj mRes (vd (get dMtx1 i) (get dMtx2 i))))
	)
	(subvec mRes 1 (count mRes))
)

(defn m*s [mMtx scalN]
	(def mRes (vector 0))
	(doseq [i mMtx]
		(def mRes (conj mRes (v*s i scalN)))
	)
	(subvec mRes 1 (count mRes))
)

(defn m*m [mMtx1 mMtx2]
    (def rMtx (vector 0))
	(doseq [i mMtx1]
		(def iterVec (vector 0))
		(doseq [j mMtx2]
			(def iterVec (conj iterVec (scalar i j) ))
		)
		(def rMtx (conj rMtx (subvec iterVec 1 (count iterVec))))
	)
	(subvec rMtx 1 (count rMtx))
)

(defn m*v [mMtx vec1]
    (getCol (m*m mMtx (vector vec1)) 0)
)

(defn transpose [tMtx]
    (def assist (vector 0))
    (dotimes [curI (count tMtx)]
        (def assist (conj assist (getCol tMtx curI)))
    )
    (subvec assist 1 (count assist))
)	
(println(v*s (vector 2 2) 2))
