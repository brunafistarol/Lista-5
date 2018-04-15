(in-package :lista)

;; (defmacro while (test &body body)
;;   (let ((gtop (gensym))
;; 	(gend (gensym)))
;;     `(tagbody
;; 	,gtop
;; 	(if (not ,test)
;; 	    (go ,gend))
;; 	,@body
;; 	(go ,gtop)
;; 	,gend)))

(defmacro while ((test &optional (result nil)) &body body)
  `(do ()
       ((not ,test) ,result)
     ,@body))


(defclass node ()
  ((obj     :accessor node-obj
	    :initarg :obj)
   (visited :accessor node-visited
	    :initarg :visited
	    :initform nil)
   (pre     :accessor node-pre
	    :initarg :pre)
   (pos     :accessor node-pos
	    :initarg :pos)
   (cc      :accessor node-cc
	    :initarg :cc)
   (color   :accessor node-color
	    :initarg :color
	    :initform nil)
   (nbs     :accessor node-nbs
	    :initarg :nbs
	    :initform nil)))


(defun make-graph (alists &optional (test #'equal))
  (let ((tb (make-hash-table :test test)))
    (mapc (lambda (al)
	    (setf (gethash (car al) tb)
		  (make-instance 'node :obj (car al))))
	  alists)
    (mapcar (lambda (al)
	      (let ((u (gethash (car al) tb)))
		(dolist (v (cadr al))
		  (push (gethash v tb) (node-nbs u)))
		(setf (node-nbs u) (reverse (node-nbs u)))
		u))
	    alists)))


(defun make-clocker (n)
  (let ((clock n))
    (lambda () (incf clock))))


