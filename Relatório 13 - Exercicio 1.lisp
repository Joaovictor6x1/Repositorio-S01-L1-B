(defstruct erva
  nome
  preco-base)

(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 12) (< peso 40)) "10ml")
    ((or (< idade 60) (< peso 80)) "25ml")
    (t "50ml")))

(defun ajusta-preco (erva)
  (cond
    ((string= (erva-nome erva) "Ginseng")
     (* (erva-preco-base erva) 3.0))
    ((string= (erva-nome erva) "Lotus")
     (* (erva-preco-base erva) 1.5))
    (t (erva-preco-base erva))))

(defun descricao-erva (erva peso idade)
  (format nil
          "~A | Preco: R$~,2f | Dosagem: ~A"
          (erva-nome erva)
          (ajusta-preco erva)
          (calcula-dosagem peso idade)))

(defun main ()
  (let ((ginseng (make-erva :nome "Ginseng" :preco-base 20))
        (lotus (make-erva :nome "Lotus" :preco-base 15))
        (camomila (make-erva :nome "Camomila" :preco-base 10)))

    (print (descricao-erva ginseng 30 10))
    (print (descricao-erva lotus 65 25))
    (print (descricao-erva camomila 90 70))))

(main)
