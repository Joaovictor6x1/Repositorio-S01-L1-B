#include <iostream>
#include <string>
using namespace std;

class Robo {
public:
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

    Robo(string modelo, int versao, float potenciaLaser, int integridade) {
        this->modelo = modelo;
        this->versao = versao;
        this->potenciaLaser = potenciaLaser;
        this->integridade = integridade;
    }

    void disparar(Robo &alvo) {
        cout << modelo << " disparou em " << alvo.modelo << "!" << endl;
        alvo.integridade -= (int)potenciaLaser;
        cout << "Dano causado: " << potenciaLaser << endl;
    }

    void exibirStatus() {
        cout << "=== Status do Robo ===" << endl;
        cout << "Modelo: " << modelo << endl;
        cout << "Versao: " << versao << endl;
        cout << "Potencia Laser: " << potenciaLaser << endl;
        cout << "Integridade: " << integridade << endl;
        cout << "=====================" << endl;
    }
};

int main() {
    Robo robo1("Alpha-X", 3, 45.5f, 100);
    Robo robo2("Beta-Z", 2, 30.0f, 80);

    cout << "--- Estado inicial ---" << endl;
    robo1.exibirStatus();
    robo2.exibirStatus();

    cout << "\n--- Confronto ---" << endl;
    robo1.disparar(robo2);

    cout << "\n--- Estado final ---" << endl;
    robo1.exibirStatus();
    robo2.exibirStatus();

    return 0;
}
