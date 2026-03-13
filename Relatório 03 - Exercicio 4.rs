use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let npt = (nota1 + nota2) / 2.0;
    let media_final = (npt * 0.7) + (nota3 * 0.3);
    media_final
}

fn main() {
    let mut nota1 = String::new();
    let mut nota2 = String::new();
    let mut nota3 = String::new();

    println!("Digite a nota NP1:");
    io::stdin().read_line(&mut nota1).expect("Erro");

    println!("Digite a nota NP2:");
    io::stdin().read_line(&mut nota2).expect("Erro");

    println!("Digite a nota NPL:");
    io::stdin().read_line(&mut nota3).expect("Erro");

    let nota1: f64 = nota1.trim().parse().expect("Numero invalido");
    let nota2: f64 = nota2.trim().parse().expect("Numero invalido");
    let nota3: f64 = nota3.trim().parse().expect("Numero invalido");

    let media = calcular_media(nota1, nota2, nota3);

    println!("Media final: {}", media);

    if media >= 60.0 {
        println!("Parabens! Voce foi aprovado.");
    } else {
        println!("Voce foi reprovado.");
    }
}
