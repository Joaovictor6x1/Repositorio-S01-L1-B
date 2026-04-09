#include <iostream>
#include <string>
using namespace std;

// Classe base
class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string nome, int idade) {
        this->nome = nome;
        this->idade = idade;
    }

    // Getters
    string getNome() { return nome; }
    int getIdade() { return idade; }

    // Setters
    void setNome(string nome) { this->nome = nome; }
    void setIdade(int idade) { this->idade = idade; }
};

// Classe filha Protagonista
class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string nome, int idade, int nivel) : Pessoa(nome, idade) {
        this->nivel = nivel;
    }

    int getNivel() { return nivel; }
    void setNivel(int nivel) { this->nivel = nivel; }

    void exibirStatus() {
        cout << "=== Protagonista ===" << endl;
        cout << "Nome: " << getNome() << endl;
        cout << "Idade: " << getIdade() << endl;
        cout << "Nivel: " << nivel << endl;
        cout << "====================" << endl;
    }
};

// Classe filha Personagem
class Personagem : public Pessoa {
private:
    int rank; // Social link: 0 a 10

public:
    Personagem(string nome, int idade, int rank) : Pessoa(nome, idade) {
        if (rank < 0) rank = 0;
        if (rank > 10) rank = 10;
        this->rank = rank;
    }

    int getRank() { return rank; }
    void setRank(int rank) {
        if (rank < 0) rank = 0;
        if (rank > 10) rank = 10;
        this->rank = rank;
    }

    void exibirStatus() {
        cout << "=== Personagem ===" << endl;
        cout << "Nome: " << getNome() << endl;
        cout << "Idade: " << getIdade() << endl;
        cout << "Rank (Social Link): " << rank << "/10" << endl;
        cout << "==================" << endl;
    }
};

int main() {
    Protagonista p1("Neymar", 34, 99);
    Personagem   p2("Kaio Jorge", 23, 7);

    p1.exibirStatus();
    p2.exibirStatus();

    return 0;
}
