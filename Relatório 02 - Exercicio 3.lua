print("Quantos números deseja digitar?")
N = tonumber(io.read())

numeros = {}
impares = {}

for i = 1, N do
    print("Digite o número " .. i .. ":")
    numeros[i] = tonumber(io.read())
end

for i = 1, N do
    if numeros[i] % 2 ~= 0 then
        table.insert(impares, numeros[i])
    end
end

print("Números ímpares encontrados:")
for i = 1, #impares do
    print(impares[i])
end
