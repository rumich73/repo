(defun c:mipunto()
  (setq punto(getpoint "\nIndica un punto"))
  (princ "\nLas coordenadas del punto: ")
  (princ punto)
  (princ)
)

(defun c:cr()
	(setq PC (getpoint "\nIndica el punto centro del círculo: "))
	(setq DIAM (getreal "\nIngresa el radio del nuevo círculo: "))
	(command "_circle" PC DIAM)
	(princ)
)

(defun c:milinea()
  (setq punto1 (getpoint "\nIndica un punto"))
  (setq x1 (car punto1))
  (setq y1 (cadr punto1))
  (princ "\nX1: ")  
  (princ x1)
  (princ "\nY1: ")  
  (princ y1)
  (setq x2 (+ x1 20))
  (setq y2 (+ y1 20))
  (setq punto2 (list x2 y2)) 
  (princ)
  (command "_line" punto1 punto2 "" )
  (princ)
)






