(in-package :lista)

(def-suite all-tests)

(in-suite all-tests)

(defun test-lista-5 ()
  (run! 'all-tests))

(test test-question-4.1-a
      (mapcar #'(lambda (resposta gabarito)
		  (when (listp resposta)
		    (is (equal resposta gabarito))))
	      (question-4.1-a)
	      '(1 (0 inf inf inf inf inf inf inf)
		2 (0 1 inf inf 4 8 inf inf)
		3 (0 1 3 inf 4 7 7 inf)
		4 (0 1 3 4 4 7 5 inf)
		5 (0 1 3 4 4 7 5 8)
		6 (0 1 3 4 4 7 5 8)
		7 (0 1 3 4 4 6 5 6)
		8 (0 1 3 4 4 6 5 6))))


(test test-question-4.1-b
      (is (equal (question-4.1-b)
		 '(A 1 (B 2 (C 1 (D) 2 (G 1 (F) 1 (H)))) 4 (E)))))

(test test-question-4.2-a
  (is (equal
       (question-4.2-a)
       '((0 (0 inf inf inf inf inf inf inf inf inf))
	 (1 (0 7 inf 6 inf 6 5 inf inf inf))
	 (2 (0 7 11 5 7 6 4 8 7 8))
	 (3 (0 7 11 5 7 6 4 8 7 7))
	 (4 (0 7 11 5 7 6 4 8 7 7))
	 (5 (0 7 11 5 7 6 4 8 7 7))
	 (6 (0 7 11 5 7 6 4 8 7 7))
	 (7 (0 7 11 5 7 6 4 8 7 7))
	 (8 (0 7 11 5 7 6 4 8 7 7))
	 (9 (0 7 11 5 7 6 4 8 7 7))))))


(test test-question-4.2-b
      (is (equal (question-4.2-b)
		 '(S 7 (A 4 (B -4 (H  1 (G -1 (I)))) -2 (C 2 (D))) 6 (E -2 (F))))))

(test test-question-4.5
      (is (equal (question-4.5 '((A ((B 2) (C 3))) (B ((A 2) (C 3))) (C ((B 1))))
			       'A 'B)
		 1))
      (is (equal (question-4.5 '((A ((B 2) (C 1))) (B ((A 2) (C 3))) (C ((B 1))))
			       'A 'B)
		 2))
      (is (equal (question-4.5 '((A ((B 3) (C 1))) (B ((A 2) (C 3))) (C ((B 2) (D 1))) (D ((B 1))))
			       'A 'B)
		 3)))

(test test-question-4.11
      (is (equal (question-4.11 '((A ((B 1))) (B ((A 1)))))
		 2))
      (is (equal (question-4.11 '((A ((B 3))) (B ((A 3))) (C ((D 2))) (D ((C 2)))))
		 4))
      (is (equal (question-4.11 '((A ((B 1) (C 2))) (B ((A 5))) (C ((D 1))) (D ((A 1)))))
		 4))
      (is (equal (question-4.11 '((A ((B 3))) (B ())))
		 nil)))

(test test-question-4.13-a
      (is (equal (question-4.13-a '((A ((B 10))) (B ((A 10))))
				  'A 'B 10)
		 t))
      (is (equal (question-4.13-a '((A ((B 10))) (B ((A 10))))
				  'A 'B 5)
		 nil))
      (is (equal (question-4.13-a '((A ((B 11) (C 5))) (B ((A 11) (C 6))) (C ((A 5) (B 6))))
				  'A 'B 6)
		 t))
      (is (equal (question-4.13-a '((A ((B 11) (C 5))) (B ((A 11) (C 6) (D 6))) (C ((A 5) (B 6)))
				    (D ((B 6))))
				  'A 'D 7))
	  t))

(test test-question-4.13-b
      (is (equal (question-4.13-b '((A ((B 11))) (B ((A 11))))
				  'B 'A)
		 11))
      (is (equal (question-4.13-b '((A ((B 11) (C 5))) (B ((A 11) (C 1))) (C ((A 5) (B 1))))
				  'B 'C)
		 1))
      (is (equal (question-4.13-b '((A ((B 11) (C 5))) (B ((A 11) (C 1))) (C ((A 5) (B 1))))
				  'A 'B)
		 5))
      (is (equal (question-4.13-b '((A ((B 11) (C 5))) (B ((A 11) (C 6) (D 5))) (C ((A 5) (B 6)))
				    (D ((B 5))))
				  'A 'D)
		 6))
      (is (equal (question-4.13-b '((A ((B 11) (C 5))) (B ((A 11) (C 6) (D 5))) (C ((A 5) (B 6)))
				    (D ((B 5) (F 10))) (F ((D 10))))
				  'A 'F)
		 10))
      (is (equal (question-4.13-b '((A ((B 11) (C 5))) (B ((A 11) (D 33))) (C ((A 5) (D 5)))
				    (D ((B 33) (C 5))))
				  'A 'C)
		 5)))

(test test-question-4.18
      (is (equal (question-4.18 '((S ((A 2) (B 2) (C 4))) 
				  (A ((S 2) (C 2))) 
				  (B ((S 2) (C 2)))
				  (C ((A 2) (B 2) (D 1) (E 1) (F 3))) 
				  (D ((C 1) (F 1)))
				  (E ((C 1) (F 1))) 
				  (F ((C 3) (D 1) (E 1)))))
		 '((S 0) (A 1) (B 1) (C 1) (D 2) (E 2) (F 3))))
      (is (equal (question-4.18 '((S ((A 2) (B 1)))
				  (A ((S 2) (B 1)))
				  (B ((S 1) (A 1)))))
		 '((S 0) (A 1) (B 1))))
      (is (equal (question-4.18 '((S ((A 10) (B 1)))
				  (A ((S 10) (C 3)))
				  (B ((S 1) (C 5)))
				  (C ((A 3)))))
		 '((S 0) (A 3) (B 1) (C 2)))))

