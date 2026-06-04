data Item = Item {
    nome :: String,
    categoria :: String,
    preco :: Double
} deriving Show

data StatusCompra = Pendente | Concluida | Cancelada
    deriving (Show, Eq)

data Compra = Compra {
    itens :: [Item],
    statusCompra :: StatusCompra
} deriving Show

totalItens :: [Item] -> Double
totalItens lista = sum (map preco lista)

valorFinal :: Compra -> Double
valorFinal compra
    | statusCompra compra == Cancelada = 0.0
    | total > 200 = total * 0.9
    | otherwise = total
    where total = totalItens (itens compra)

main :: IO ()
main = do
    let chuteira = Item "Chuteira Cristiano" "Esporte" 120
    let bola = Item "Bola Messi" "Esporte" 80
    let camisa = Item "Camisa Neymar" "Roupa" 60

    let compra = Compra [chuteira, bola, camisa] Concluida

    print (valorFinal compra)
