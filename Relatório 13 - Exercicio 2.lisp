(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defun filtra-por-perigo (catalogo)
  (remove-if
   (lambda (c)
     (string= (criatura-periculosidade c) "Baixa"))
   catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar
   (lambda (c)
     (format nil "~A: Vive em ~A"
             (criatura-nome c)
             (criatura-ambiente c)))
   (remove-if-not
    (lambda (c)
      (string= (criatura-ambiente c) "Deep"))
    catalogo)))

(defun descricao-criatura (c)
  (format nil
          "~A | Ambiente: ~A | Perigo: ~A"
          (criatura-nome c)
          (criatura-ambiente c)
          (criatura-periculosidade c)))

(defun main ()

  (let ((catalogo
         (list
          (make-criatura
           :nome "Peeper"
           :ambiente "Safe Shallows"
           :periculosidade "Baixa"
           :vida-media 5)

          (make-criatura
           :nome "Reaper Leviathan"
           :ambiente "Crash Zone"
           :periculosidade "Alta"
           :vida-media 80)

          (make-criatura
           :nome "Kaio Jorge"
           :ambiente "Deep"
           :periculosidade "Alta"
           :vida-media 100)

          (make-criatura
           :nome "Fabricio Bruno"
           :ambiente "Deep"
           :periculosidade "Media"
           :vida-media 20))))

    (format t "~%CATALOGO~%")
    (mapc #'print
          (mapcar #'descricao-criatura catalogo))

    (format t "~%PERIGOSAS~%")
    (mapc #'print
          (mapcar #'descricao-criatura
                  (filtra-por-perigo catalogo)))

    (format t "~%DEEP~%")
    (mapc #'print
          (relatorio-profundidade catalogo))))

(main)
