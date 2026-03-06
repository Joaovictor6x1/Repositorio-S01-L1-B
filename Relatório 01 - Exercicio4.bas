DIM distancia AS DOUBLE
DIM combustivel AS DOUBLE
DIM consumo AS DOUBLE

INPUT "Digite a distancia percorrida em km: ", distancia
INPUT "Digite o combustivel gasto em litros: ", combustivel

consumo = distancia / combustivel

PRINT "Consumo medio do veiculo (km por litro): "; consumo
