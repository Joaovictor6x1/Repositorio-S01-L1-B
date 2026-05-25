import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() { return nome; }

    public abstract void virarPrato();
}

class Lagosta extends Monstro {
    public Lagosta() {
        super("Lagosta Gigante");
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi cozinha a Lagosta Gigante em caldo de ervas da masmorra");
    }
}

class Cogumelo extends Monstro {
    public Cogumelo() {
        super("Cogumelo Tóxico");
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi neutraliza o veneno do Cogumelo Tóxico e o refoga com manteiga");
    }
}

class Tempero {
    private String nome;
    private String quantidade;

    public Tempero(String nome, String quantidade) {
        this.nome = nome;
        this.quantidade = quantidade;
    }

    @Override
    public String toString() {
        return quantidade + " de " + nome;
    }
}

class Prato {
    private String nome;
    private Monstro monstro;
    private Tempero tempero;

    public Prato(String nome, Monstro monstro) {
        this.nome = nome;
        this.monstro = monstro;
        this.tempero = new Tempero("Sal da Caverna", "uma pitada");
    }

    public void servir() {
        System.out.println("\n    " + nome + "     ");
        monstro.virarPrato();
        System.out.println("Temperado com: " + tempero);
    }
}

public class Main {
    public static void main(String[] args) {
        Lagosta lagosta = new Lagosta();
        Cogumelo cogumelo = new Cogumelo();

        Prato pratLagosta = new Prato("Lagosta Grelhada da Masmorra", lagosta);
        Prato pratCogumelo = new Prato("Cogumelo Refogado do Senshi", cogumelo);

        pratLagosta.servir();
        pratCogumelo.servir();

        System.out.println("\n    Cardápio da Expedição    ");
        ArrayList<Prato> cardapio = new ArrayList<>();
        cardapio.add(pratLagosta);
        cardapio.add(pratCogumelo);

        for (Prato p : cardapio) {
            p.servir();
        }
    }
}
