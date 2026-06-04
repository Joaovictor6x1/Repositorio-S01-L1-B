data Bebida = Bebida {
    nome :: String,
    tipo :: String,
    preco :: Double
} deriving Show

data StatusPedido = Aberto | Entregue | Cancelado
    deriving (Show, Eq)

data Pedido = Pedido {
    bebidas :: [Bebida],
    status :: StatusPedido
} deriving Show

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | status pedido == Cancelado = 0.0
    | otherwise = sum (map preco (bebidas pedido))

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida"
primeiraBebida (Pedido (x:_) _) = nome x

main :: IO ()
main = do
    let cafe = Bebida "Cafe Neymar" "Quente" 8.0
    let suco = Bebida "Suco Messi" "Frio" 12.0

    let pedido1 = Pedido [cafe, suco] Entregue
    let pedido2 = Pedido [cafe] Cancelado

    print (valorTotalPedido pedido1)
    print (valorTotalPedido pedido2)
    putStrLn (primeiraBebida pedido1)
