(asdf:defsystem #:lista
  :license "Specify license here"
  :serial t
  :depends-on (#:cl-heap)
  :components ((:file "package")
               (:file "answers")
	       (:file "tests")))
