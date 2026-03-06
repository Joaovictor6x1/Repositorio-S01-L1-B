DIM senhaCorreta AS INTEGER
DIM senha AS INTEGER

senhaCorreta = 1234

INPUT "Digite a senha: "; senha

WHILE senha <> senhaCorreta
    PRINT "Senha incorreta. Tente novamente."
    INPUT "Digite a senha novamente: "; senha
WEND

PRINT "Acesso liberado!"

END
