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


(defun question-4.1-a ()
  "Colocar as distancia de todos os nos apos vistar todos os 
   vizinhos do no retirado da fila de prioridades em cada iteracao.
   Se o no retirado da fila de prioridades nao tiver vizinho apenas 
   repita as distancias encontradas ate o momento."
  '((0 (0 inf inf inf inf inf inf inf))
    (1 ("distancias encotradas"))))


(defun question-4.1-b ()
  "A arvore a seguir e a apresentada na figura 4.9 do livro."
  '(A 2 (C 1 (B 2 (D) 3 (E)))))


(defun question-4.2-a ()
  "O exemplo a seguir apresenta a tabela encontrada na figura 4.14."
  '((0 (0 inf inf inf inf inf inf inf inf inf))
    (1 (0 10 inf inf inf inf inf 8))
    (2 (0 10 inf inf inf 12 9 8))
    (3 (0 5 10 inf inf 8 9 8))
    (4 (0 5 6 11 inf 7 9 8))
    (5 (0 5 5 7 14 7 9 8))
    (6 (0 5 5 6 10 7 9 8))
    (7 (0 5 5 6 9 7 9 8))))


(defun question-4.2-b ()
  "A arvore a seguir e a apresentada na figura 4.9 do livro."
  '(A 2 (C 1 (B 2 (D) 3 (E)))))


(defun gquestion-4.5 (graph-as-lists source target)
  "O output deve ser a quantidade dos menores caminhos entre 
   os dois nos.")


(defun question-4.11 (graph-as-lists)
  "O output deve ser o tamanho do menor ciclo ou nil se o grafo
   for aciclico.")


(defun question-4.13-a (graph-as-lists source target)
  "O output deve ser t se o carro consegue chegar a cidade 
  target e nil, caso contrtraio ")


(defun question-4.13-b (graph-as-lists source target)
  "O output deve ser menor valor que o tanque
   do novo carro deve ter.")

(defun question-4.18 (graph-as-lists)
  "Considere quem sempre estamos partindo do no S.
   Exemplo de input e output:
   - ((S ((A 2) (B 2) (C 4))) (A ((S 2) (C 2))) (B ((S 2) (C 2)))
      (C ((A 2) (B 2) (D 1) (E 1) (F 3))) (D ((C 1) (F 1)))
       (E ((C 1) (F 1))) (F ((C 3) (D 1) (E 1))))
   - ((S 0) (A 1) (B 1) (C 1) (D 2) (E 2) (F 3))")



