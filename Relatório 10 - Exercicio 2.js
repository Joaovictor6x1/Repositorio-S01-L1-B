// ===== INTERFACE (simulação) =====
class Habilidade {
  usar() {
    throw new Error("O método usar() precisa ser sobrescrito!");
  }
}

// ===== HABILIDADES =====
class Smoke extends Habilidade {
  usar() {
    console.log("💨 Fumaça lançada! Bloqueando visão do inimigo.");
  }
}

class Flash extends Habilidade {
  usar() {
    console.log("⚡ Flash lançado! Inimigos cegados.");
  }
}

class Dash extends Habilidade {
  usar() {
    console.log("💨 Dash executado! Reposicionando rapidamente.");
  }
}

class Armadilha extends Habilidade {
  usar() {
    console.log("🪤 Armadilha colocada! Área monitorada.");
  }
}

// ===== COMPOSIÇÃO: Agente TEM uma Habilidade =====
class Agente {
  #habilidade; // privado

  constructor(nome, funcao, habilidade) {
    this.nome = nome;
    this.funcao = funcao;
    this.#habilidade = habilidade; // composição
  }

  get habilidade() {
    return this.#habilidade;
  }

  entrarEmCombate() {
    console.log(`\n[${this.funcao}] ${this.nome} entrou em combate!`);
    this.#habilidade.usar();
  }
}

// ===== AGREGAÇÃO: Time TEM Agentes =====
class Time {
  constructor(agentes) {
    this.agentes = agentes; // agregação (agentes existem fora do Time)
  }

  iniciarPartida() {
    console.log("       PARTIDA INICIADA      ");
    this.agentes.forEach(agente => agente.entrarEmCombate());
  }

  listarControladores() {
    // instanceof verifica se a habilidade é do tipo Smoke
    return this.agentes.filter(agente => agente.habilidade instanceof Smoke);
  }
}

// ===== MAIN =====
const omen    = new Agente("Omen",   "Controlador", new Smoke());
const skye    = new Agente("Skye",   "Iniciador",   new Flash());
const jett    = new Agente("Jett",   "Duelista",    new Dash());
const cypher  = new Agente("Cypher", "Sentinela",   new Armadilha());

const time = new Time([omen, skye, jett, cypher]);

time.iniciarPartida();

console.log("\n       CONTROLADORES DO TIME        ");
const controladores = time.listarControladores();
controladores.forEach(a => console.log(`-> ${a.nome} (${a.funcao})`));
