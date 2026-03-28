#include <iostream>
using namespace std;

int main() {
    float saldo;
    int opcao;

    cout << "Informe o saldo inicial: ";
    cin >> saldo;

    do {
        cout << "\n--- MENU ---\n";
        cout << "1. Ver saldo\n";
        cout << "2. Depositar\n";
        cout << "3. Sacar\n";
        cout << "4. Sair\n";
        cout << "Escolha: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Saldo atual: R$ " << saldo << endl;
                break;

            case 2: {
                float valor;
                cout << "Valor para deposito: ";
                cin >> valor;
                saldo += valor;
                break;
            }

            case 3: {
                float valor;
                cout << "Valor para saque: ";
                cin >> valor;

                if (valor > saldo) {
                    cout << "Saldo insuficiente!\n";
                } else {
                    saldo -= valor;
                }
                break;
            }

            case 4:
                cout << "Encerrando...\n";
                break;

            default:
                cout << "Opcao invalida!\n";
        }

    } while (opcao != 4);

    return 0;
}
