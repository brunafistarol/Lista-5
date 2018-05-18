
(defpackage #:lista
  (:use #:cl #:cl-heap))

(defpackage #:tests
  (:use #:cl #:lista)
  (:export #:run!
       #:test-lista-5))
