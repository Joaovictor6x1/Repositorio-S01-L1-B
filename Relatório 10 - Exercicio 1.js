class Pokemon {
  #vida; // atributo privado (encapsulamento real no JS moderno)

  constructor(nome, tipo, vida = 100) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vida;
  }

  // getter para ler a vida de fora
  get vida() {
    return this.#vida;
  }

  atacar() {
    console.log(`${this.nome} usou um ataque genérico!`);
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0; // vida não pode ficar negativa
    console.log(`${this.nome} recebeu ${dano} de dano! Vida restante: ${this.#vida}`);
  }
}

class Pikachu extends Pokemon {
  constructor() {
    super("Pikachu", "Elétrico", 100);
  }

  atacar() {
    console.log(`${this.nome} usou Thunderbolt! `);
  }
}

class Charizard extends Pokemon {
  constructor() {
    super("Charizard", "Fogo/Voador", 120);
  }

  atacar() {
    console.log(`${this.nome} usou Lança-chamas! `);
  }
}

// Main
const pikachu = new Pikachu();
const charizard = new Charizard();

pikachu.atacar();
charizard.atacar();

pikachu.receberDano(30);
console.log(`Vida do ${pikachu.nome}: ${pikachu.vida}`); // via getter
