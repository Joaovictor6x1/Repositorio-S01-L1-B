// ===== COMPOSIÇÃO: Diario CRIA e CONTROLA suas Criaturas =====

class Criatura {
  constructor(nome, perigo) {
    this.nome = nome;
    this.perigo = perigo;
  }
}

class Diario {
  #criaturas; // composição: o array nasce e morre com o Diário

  constructor() {
    this.#criaturas = []; // instanciado internamente
  }

  registrarCriatura(criatura) {
    this.#criaturas.push(criatura);
    console.log(`📖 Criatura "${criatura.nome}" registrada no Diário 3!`);
  }

  listarCriaturas() {
    console.log("\n===== CRIATURAS DO DIÁRIO 3 =====");
    this.#criaturas.forEach(c => {
      console.log(`👾 ${c.nome} | Nível de perigo: ${c.perigo}`);
    });
  }
}

// ===== AGREGAÇÃO: CabanaMisterio RECEBE Personagens já criados =====

class Personagem {
  constructor(nome) {
    this.nome = nome;
  }
}

class CabanaMisterio {
  constructor(personagens) {
    this.personagens = personagens; // agregação: existem fora da Cabana
  }

  listarFuncionarios() {
    console.log("\n===== FUNCIONÁRIOS DA CABANA DO MISTÉRIO =====");
    this.personagens.forEach(p => console.log(`🏠 ${p.nome}`));
  }
}

// ===== MAIN =====

// Composição: Diário instancia o array internamente
const diario = new Diario();

const gnomo      = new Criatura("Gnomo Vomitador", "Alto");
const unicornio  = new Criatura("Unicórnio Maligno", "Médio");
const bill       = new Criatura("Bill Cipher", "EXTREMO ⚠️");

diario.registrarCriatura(gnomo);
diario.registrarCriatura(unicornio);
diario.registrarCriatura(bill);

diario.listarCriaturas();

// Agregação: Personagens criados fora da Cabana
const stan   = new Personagem("Grunkle Stan");
const mabel  = new Personagem("Mabel");
const soos   = new Personagem("Soos");

const cabana = new CabanaMisterio([stan, mabel, soos]);
cabana.listarFuncionarios();
