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

(defun c:mostrarelementos ( / mylist n)
  ;; Definir la lista que se va a recorrer
  (setq mylist '(10 20 30 40 50))
  
  ;; Obtener la longitud de la lista
  (setq n (length mylist))
  
  ;; Recorrer la lista y mostrar cada elemento
  (princ "\nElementos de la lista:")
  (repeat n
    (princ "\nElemento: ")
    (princ (car mylist))
    ;; Avanzar al siguiente elemento de la lista
    (setq mylist (cdr mylist))
  )
  (princ)
)

(defun c:MostrarPuntosDeInicio ( / Seleccion i Nombre Lista PuntoDeInicio)
  (prompt "\nSeleccione las líneas para mostrar sus puntos de inicio: ")
  ;; Seleccionar líneas
  (setq Seleccion (ssget '((0 . "LINE"))))
  
  ;; Verificar si la selección no está vacía
  (if Selecciongit
    (progn
      ;; Recorrer la selección y mostrar los puntos de inicio
      (setq i 0)
      (while (< i (sslength Seleccion))
        (setq Nombre (ssname Seleccion i))        ; Obtener el nombre de la entidad
        (setq Lista (entget Nombre))              ; Obtener la lista de asociación de la entidad
        (setq PuntoDeInicio (cdr (assoc 10 Lista))) ; Obtener el punto de inicio (código de grupo 10)
        
        ;; Mostrar el punto de inicio de la línea
        (prompt (strcat "\nEl punto de inicio de la línea es: "
                        (rtos (car PuntoDeInicio) 2 2) ", "
                        (rtos (cadr PuntoDeInicio) 2 2) ", "
                        (rtos (caddr PuntoDeInicio) 2 2)))
        
        ;; Incrementar el contador
        (setq i (1+ i))
      )
    )
    (prompt "\nNo se seleccionaron líneas.")
  )
  (princ)
)

