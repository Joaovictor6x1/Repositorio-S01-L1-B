function soma(a, b)
    return a + b
end

function subtracao(a, b)
    return a - b
end

function multiplicacao(a, b)
    return a * b
end

function divisao(a, b)
    return a / b
end

function calculadora(a, b, op)
    if op == "+" then
        return soma(a, b)
    elseif op == "-" then
        return subtracao(a, b)
    elseif op == "*" then
        return multiplicacao(a, b)
    elseif op == "/" then
        return divisao(a, b)
    else
        return "Erro: operador inválido"
    end
end

print("Digite o primeiro número:")
a = tonumber(io.read())

print("Digite o segundo número:")
b = tonumber(io.read())

print("Digite o operador (+ - * /):")
op = io.read()

resultado = calculadora(a, b, op)

print("Resultado:", resultado)
