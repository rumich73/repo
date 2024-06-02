
(defun c:cr()
	(setq PC (getpoint "\nIndica el punto centro del círculo: "))
	(setq DIAM (getreal "\nIngresa el radio del nuevo círculo: "))
	(command "_circle" PC DIAM)
	(princ)
)