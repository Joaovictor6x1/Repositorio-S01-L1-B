use std::io;

fn eh_impar(numero: i32) -> bool {
    numero % 2 != 0
}

fn main() {
    let mut escolha = String::new();
    let mut num1 = String::new();
    let mut num2 = String::new();

    println!("Jogador 1 escolha: par ou impar");
    io::stdin().read_line(&mut escolha).expect("Erro");

    println!("Jogador 1 digite um numero:");
    io::stdin().read_line(&mut num1).expect("Erro");

    println!("Jogador 2 digite um numero:");
    io::stdin().read_line(&mut num2).expect("Erro");

    let num1: i32 = num1.trim().parse().expect("Numero invalido");
    let num2: i32 = num2.trim().parse().expect("Numero invalido");

    let soma = num1 + num2;

    let resultado_impar = eh_impar(soma);

    println!("Soma dos numeros: {}", soma);

    if (resultado_impar && escolha.trim() == "impar") ||
       (!resultado_impar && escolha.trim() == "par") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}
