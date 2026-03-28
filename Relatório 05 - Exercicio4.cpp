#include <iostream>
using namespace std;

int main() {
    int sala[5][5] = {0};
    int opcao;

    do {
        cout << "\n--- MENU ---\n";
        cout << "1. Reservar Assento\n";
        cout << "2. Ver Mapa\n";
        cout << "3. Sair\n";
        cout << "Escolha: ";
        cin >> opcao;

        switch (opcao) {
            case 1: {
                int f, c;
                cout << "Digite a fileira (0-4): ";
                cin >> f;
                cout << "Digite a coluna (0-4): ";
                cin >> c;

                if (sala[f][c] == 0) {
                    sala[f][c] = 1;
                    cout << "Sucesso!\n";
                } else {
                    cout << "Erro: Assento ocupado!\n";
                }
                break;
            }

            case 2:
                cout << "\nMapa da sala:\n";
                for (int i = 0; i < 5; i++) {
                    for (int j = 0; j < 5; j++) {
                        cout << "[" << sala[i][j] << "] ";
                    }
                    cout << endl;
                }
                break;

            case 3:
                cout << "Saindo...\n";
                break;

            default:
                cout << "Opcao invalida!\n";
        }

    } while (opcao != 3);

    // Relatório final
    int ocupados = 0, vazios = 0;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (sala[i][j] == 1)
                ocupados++;
            else
                vazios++;
        }
    }

    cout << "\n--- RELATORIO FINAL ---\n";
    cout << "Assentos ocupados: " << ocupados << endl;
    cout << "Assentos vazios: " << vazios << endl;

    return 0;
}
