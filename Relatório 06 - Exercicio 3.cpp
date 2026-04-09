#include <iostream>
#include <string>
using namespace std;

// Classe base
class MembroInatel {
public:
    string nomeCompleto;

    MembroInatel(string nome) {
        this->nomeCompleto = nome;
    }

    virtual void identificar() {
        cout << "Sou um membro da comunidade Inatel: " << nomeCompleto << "." << endl;
    }

    virtual ~MembroInatel() {} // destrutor virtual (boa prática com polimorfismo)
};

// Classe filha Coordenador
class Coordenador : public MembroInatel {
public:
    string departamento;

    Coordenador(string nome, string departamento) : MembroInatel(nome) {
        this->departamento = departamento;
    }

    void identificar() override {
        cout << "Meu nome eh " << nomeCompleto
             << ", sou o coordenador do departamento de "
             << departamento << " no Inatel." << endl;
    }
};

// Classe filha Pesquisador
class Pesquisador : public MembroInatel {
public:
    string laboratorio;

    Pesquisador(string nome, string laboratorio) : MembroInatel(nome) {
        this->laboratorio = laboratorio;
    }

    void identificar() override {
        cout << "Meu nome eh " << nomeCompleto
             << ", e realizo pesquisas no laboratorio "
             << laboratorio << " do Inatel." << endl;
    }
};

int main() {
    // Ponteiros da classe base
    MembroInatel* membro1 = new Coordenador("Joao Victor", "Engenharia de Software");
    MembroInatel* membro2 = new Pesquisador("Marina Carvalho", "Redes e Telecomunicacoes");

    cout << "    Identificacao dos Membros    " << endl;
    membro1->identificar(); // chama o metodo do Coordenador
    membro2->identificar(); // chama o metodo do Pesquisador

    // Liberar memoria
    delete membro1;
    delete membro2;

    return 0;
}
