data Banda = Banda {
    nome :: String,
    genero :: String,
    cache :: Double
} deriving Show

data StatusEvento = Ativo | Encerrado | Cancelado
    deriving (Show, Eq)

data Evento = Evento {
    bandas :: [Banda],
    statusEvento :: StatusEvento
} deriving Show

custoTotalEvento :: Evento -> Double
custoTotalEvento evento
    | statusEvento evento == Cancelado = 0.0
    | otherwise = total * 1.2
    where total = sum (map cache (bandas evento))

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda"
bandaAbertura (Evento (x:_) _) = nome x

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda"
bandaEncerramento (Evento xs _) = nome (last xs)

main :: IO ()
main = do
    let b1 = Banda "Time Neymar" "Pop" 1000
    let b2 = Banda "Time Messi" "Rock" 1500
    let b3 = Banda "Time Cristiano" "Sertanejo" 1200

    let evento1 = Evento [b1,b2,b3] Ativo
    let evento2 = Evento [b2,b3] Encerrado
    let evento3 = Evento [b1] Cancelado

    print (custoTotalEvento evento1)
    print (custoTotalEvento evento2)
    print (custoTotalEvento evento3)

    putStrLn (bandaAbertura evento1)
    putStrLn (bandaEncerramento evento1)
