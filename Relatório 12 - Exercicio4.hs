data Servico = Servico {
    nome :: String,
    tipo :: String,
    preco :: Double
} deriving Show

data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento {
    servicos :: [Servico],
    statusAtendimento :: StatusAtendimento
} deriving Show

totalServicos :: [Servico] -> Double
totalServicos lista = sum (map preco lista)

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | statusAtendimento atendimento == Cancelado = 0.0
    | length (servicos atendimento) > 3 = total * 1.25
    | otherwise = total
    where total = totalServicos (servicos atendimento)

primeiroServico :: Atendimento -> String
primeiroServico (Atendimento [] _) = "Nenhum servico"
primeiroServico (Atendimento (x:_) _) = nome x

main :: IO ()
main = do
    let s1 = Servico "Corte Neymar" "Cabelo" 50
    let s2 = Servico "Barba Messi" "Barba" 40
    let s3 = Servico "Massagem Cristiano" "Relaxamento" 60
    let s4 = Servico "Hidratacao Mbappe" "Estetica" 30

    let at1 = Atendimento [s1,s2,s3,s4] Finalizado
    let at2 = Atendimento [s1,s2] EmAndamento

    print (valorFinalAtendimento at1)
    print (valorFinalAtendimento at2)

    putStrLn (primeiroServico at1)
    putStrLn (primeiroServico at2)
