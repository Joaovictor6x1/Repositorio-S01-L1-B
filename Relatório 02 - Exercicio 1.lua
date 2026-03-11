print("Digite o valor inicial do intervalo (M):")
M = tonumber(io.read())

print("Digite o valor final do intervalo (N):")
N = tonumber(io.read())

print("Digite o valor da tabuada (X):")
X = tonumber(io.read())

for i = M, N do
    resultado = X * i
    print(X .. " x " .. i .. " = " .. resultado)
end
