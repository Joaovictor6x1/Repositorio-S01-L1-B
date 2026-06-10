(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun descricao-venda (item)
  (format nil
          "~A | Preco: ~,2f | Forca: ~,2f"
          (item-nome item)
          (item-preco item)
          (item-forca-magica item)))

(defun processa-venda (catalogo)

  (mapcar
   #'descricao-venda

   (mapcar
    (lambda (i)
      (make-item
       :nome (item-nome i)
       :tipo (item-tipo i)
       :preco (adiciona-imposto (item-preco i))
       :forca-magica
       (bonus-maldicao
        (item-forca-magica i))))

    (remove-if-not
     (lambda (i)
       (string= (item-tipo i) "Arma"))
     catalogo))))

(defun main ()

  (let ((catalogo
         (list
          (make-item :nome "AK-47" :tipo "Arma" :preco 100 :forca-magica 90)
          (make-item :nome "Metralhadora" :tipo "Arma" :preco 80 :forca-magica 60)
          (make-item :nome "Corinthians" :tipo "Pocao" :preco 20 :forca-magica 15)
          (make-item :nome "Azulzinho" :tipo "Tadala" :preco 150 :forca-magica 95)
          (make-item :nome "Pauzinho" :tipo "Arma" :preco 120 :forca-magica 85))))

    (mapc #'print
          (processa-venda catalogo))))

(main)
