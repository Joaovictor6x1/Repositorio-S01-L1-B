# Composição: ArmaCorpoACorpo é criada e gerenciada pelo próprio Joker
class ArmaCorpoACorpo:
    def __init__(self, nome, dano):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return f"{self.nome} (dano: {self.dano})"


# Agregação: PhantomThieves existe independente do Joker
class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} | Arma: {self.arma}"


# Joker usa composição (arma) e agregação (equipe)
class Joker:
    def __init__(self, membros: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("Faca Corsair", 85)  # composição
        self.equipe = membros                             # agregação

    def mostrar_equipe(self):
        print(f"Joker empunha: {self.arma}")
        print("\n     Phantom Thieves     ")
        for membro in self.equipe:
            print(membro)


# Main
equipe = [
    PhantomThieves("Ryuji", "Shotgun"),
    PhantomThieves("Ann", "Whip"),
    PhantomThieves("Yusuke", "Katana"),
    PhantomThieves("Makoto", "Revolver"),
]

joker = Joker(equipe)
joker.mostrar_equipe()
