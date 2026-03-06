DIM nota1 AS DOUBLE
DIM nota2 AS DOUBLE
DIM nota3 AS DOUBLE

DIM peso1 AS DOUBLE
DIM peso2 AS DOUBLE
DIM peso3 AS DOUBLE

DIM media AS DOUBLE

INPUT "Digite a primeira nota: "; nota1
INPUT "Digite o peso da primeira nota: "; peso1

INPUT "Digite a segunda nota: "; nota2
INPUT "Digite o peso da segunda nota: "; peso2

INPUT "Digite a terceira nota: "; nota3
INPUT "Digite o peso da terceira nota: "; peso3

media = (nota1 * peso1 + nota2 * peso2 + nota3 * peso3) / (peso1 + peso2 + peso3)

PRINT "Media ponderada = "; media

IF media > 70 THEN
    PRINT "Aprovado direto"
ELSE
    PRINT "Reprovado direto"
END IF

END
