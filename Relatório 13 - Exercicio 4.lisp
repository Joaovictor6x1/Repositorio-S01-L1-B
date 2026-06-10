(defstruct local
  nome
  elemento
  dificuldade
  recompensa)

(defun bonus-elemental (local)

  (cond
    ((or (string= (local-elemento local) "Pyro")
         (string= (local-elemento local) "Electro"))
     (* (local-recompensa local) 1.2))

    ((string= (local-elemento local) "Cryo")
     (* (local-recompensa local) 1.1))

    (t (local-recompensa local))))

(defun vale-a-pena (local)

  (and
   (> (bonus-elemental local) 500)
   (<= (local-dificuldade local) 3)))

(defun rota-de-farm (locais)

  (mapcar
   (lambda (l)
     (format nil
             "~A - Recompensa: ~,2f"
             (local-nome l)
             (bonus-elemental l)))

   (remove-if-not #'vale-a-pena locais)))

(defun main ()

  (let ((locais
         (list
          (make-local :nome "Maracana" :elemento "Pyro" :dificuldade 2 :recompensa 500)
          (make-local :nome "Mineirao" :elemento "Hydro" :dificuldade 1 :recompensa 400)
          (make-local :nome "Fonte Nova" :elemento "Cryo" :dificuldade 3 :recompensa 480)
          (make-local :nome "Beira Rio" :elemento "Electro" :dificuldade 2 :recompensa 450)
          (make-local :nome "Morumbi" :elemento "Anemo" :dificuldade 4 :recompensa 700))))

    (format t "~%TODOS OS LOCAIS~%")

    (dolist (l locais)
      (format t "~A -> ~,2f~%"
              (local-nome l)
              (bonus-elemental l)))

    (format t "~%ROTA RECOMENDADA~%")

    (mapc #'print
          (rota-de-farm locais))))

(main)
