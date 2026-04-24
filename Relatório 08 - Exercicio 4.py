from abc import ABC, abstractmethod


# Interface base (classe abstrata)
class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


# Composição: Implante é composto dentro do NetRunner
class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao


# Herança + Composição
class NetRunner(Cibernetico):
    def __init__(self, nome, custo_implante, funcao_implante):
        self.nome = nome
        self.implante = Implante(custo_implante, funcao_implante)  # composição

    def realizar_hack(self):
        print(f"{self.nome} executa hack [{self.implante.funcao}] | Custo: {self.implante.custo} €$")


# Faccao agrega uma lista de Ciberneticos
class Faccao:
    def __init__(self, nome):
        self.nome = nome
        self.membros: list[Cibernetico] = []

    def adicionar_membro(self, membro: Cibernetico):
        self.membros.append(membro)

    def executar_todos_hacks(self):
        print(f"\n     [{self.nome}] iniciando operação     ")
        for membro in self.membros:
            membro.realizar_hack()


# Main
faccao = Faccao("Netwatch")

faccao.adicionar_membro(NetRunner("Neymar", 1500, "Mbappe"))
faccao.adicionar_membro(NetRunner("Messi", 3000, "Fabricio Bruno"))
faccao.adicionar_membro(NetRunner("Cristiano Ronaldo", 9999, "Zeze di Camargo"))

faccao.executar_todos_hacks()
