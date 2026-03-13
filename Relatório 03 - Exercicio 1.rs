use std::io;

fn verificar_senha(senha: &str) -> bool {
    // verifica tamanho
    if senha.len() < 10 {
        return false;
    }

    let mut numeros = 0;
    let mut maiuscula = false;

    for c in senha.chars() {
        if c.is_digit(10) {
            numeros += 1;
        }
        if c.is_uppercase() {
            maiuscula = true;
        }
    }

    numeros >= 2 && maiuscula
}

fn main() {
    loop {
        let mut senha = String::new();

        println!("Digite uma senha:");

        io::stdin()
            .read_line(&mut senha)
            .expect("Erro ao ler entrada");

        let senha = senha.trim();

        if verificar_senha(senha) {
            println!("A senha eh valida, seja bem vindo!");
            break;
        } else {
            println!("Senha invalida, tente novamente.");
        }
    }
}
