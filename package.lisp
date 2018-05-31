
(defpackage #:lista
  (:use #:cl #:cl-heap))

(defpackage #:tests
  (:use #:cl #:fiveam #:lista)
  (:export #:run!
       #:test-lista-5))
