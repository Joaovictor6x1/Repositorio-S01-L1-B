#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Classe base
class MembroConselho {
public:
    string nome;

    MembroConselho(string nome) {
        this->nome = nome;
    }

    virtual void saudar() {
        cout << "Um membro do conselho faz uma reverencia silenciosa." << endl;
    }

    virtual ~MembroConselho() {}
};

// Classe filha Anao
class Anao : public MembroConselho {
public:
    Anao(string nome) : MembroConselho(nome) {}

    void saudar() override {
        cout << "Pela forca da montanha, eu sou " << nome << " e honro nosso aco!" << endl;
    }
};

// Classe filha Orc
class Orc : public MembroConselho {
public:
    Orc(string nome) : MembroConselho(nome) {}

    void saudar() override {
        cout << "Pelo sangue e gloria, eu sou " << nome << " e trago a forca de minha tribo!" << endl;
    }
};

// Classe filha Draconato
class Draconato : public MembroConselho {
public:
    Draconato(string nome) : MembroConselho(nome) {}

    void saudar() override {
        cout << "Pelo sopro dos ancestrais, eu sou " << nome << " e falo em nome dos dragoes!" << endl;
    }
};

int main() {
    // Lista de ponteiros da classe base
    vector<MembroConselho*> conselho;

    // Instancias de cada raca adicionadas a lista
    conselho.push_back(new Anao("Soteldo"));
    conselho.push_back(new Orc("Juninho Pernambucano"));
    conselho.push_back(new Draconato("Luis Suarez"));

    cout << "     Conselho de Paz das Terras Ancestrais      " << endl;
    cout << endl;

    // Percorre a lista e chama saudar() polimorficamente
    for (MembroConselho* membro : conselho) {
        membro->saudar();
    }

    // Liberar memoria
    for (MembroConselho* membro : conselho) {
        delete membro;
    }

    return 0;
}
