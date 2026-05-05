// ===== CLASSE BASE =====
class Hunter {
  constructor(nome) {
    this.nome = nome;
  }

  lutar() {
    console.log(`${this.nome} usa uma técnica genérica de Hunter!`);
  }
}

// ===== HERANÇA E SOBRESCRITA =====
class Gon extends Hunter {
  constructor() {
    super("Gon");
  }

  lutar() {
    console.log(`${this.nome} usa Jajanken! ✊ "PEDRA!"`);
  }
}

class Killua extends Hunter {
  constructor() {
    super("Killua");
  }

  lutar() {
    console.log(`${this.nome} ativa Godspeed! ⚡ Velocidade máxima!`);
  }
}

class Kurapika extends Hunter {
  constructor() {
    super("Kurapika");
  }

  lutar() {
    console.log(`${this.nome} usa as Correntes do Imperador! ⛓️ Modo Olhos Escarlates ativado!`);
  }
}

// ===== AGREGAÇÃO: TrupeFantasma recebe membros já criados =====
class TrupeFantasma {
  constructor(nome, membros) {
    this.nome = nome;
    this.membros = membros; // agregação: existem fora da Trupe
  }

  revelarMembros() {
    console.log(`\n===== MEMBROS DA ${this.nome.toUpperCase()} =====`);
    this.membros.forEach(m => console.log(`🕷️  ${m}`));
  }
}

// ===== MAIN =====
const gon      = new Gon();
const killua   = new Killua();
const kurapika = new Kurapika();

console.log("===== HUNTERS EM COMBATE =====");
gon.lutar();
killua.lutar();
kurapika.lutar();

const trupe = new TrupeFantasma("Trupe Fantasma", ["Chrollo", "Hisoka", "Feitan"]);
trupe.revelarMembros();
