import java.util.ArrayList;

class Cafe {
    private String nome;
    private double preco;

    public Cafe(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() { return nome; }
    public double getPreco() { return preco; }

    public double calcularPrecoFinal() {
        return preco;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double preco, double bonusAroma) {
        super(nome, preco);
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return getPreco() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> cafes;

    public Menu() {
        this.cafes = new ArrayList<>();
    }

    public void adicionarCafe(Cafe c) {
        cafes.add(c);
    }

    public void exibirMenu() {
        for (Cafe c : cafes) {
            System.out.println(c.getNome() + " - R$ " + c.calcularPrecoFinal());
        }
    }
}

class CafeteriaLeblanc {
    private Menu menu;

    public CafeteriaLeblanc() {
        this.menu = new Menu();
    }

    public void adicionarCafe(Cafe c) {
        menu.adicionarCafe(c);
    }

    public void abrirCafeteria() {
        System.out.println("Bem vindo ao Leblanc; aqui está nosso cardápio:");
        menu.exibirMenu();
    }
}

public class Main {
    public static void main(String[] args) {
        CafeteriaLeblanc leblanc = new CafeteriaLeblanc();
        leblanc.adicionarCafe(new Cafe("Café Simples", 5.00));
        leblanc.adicionarCafe(new Cafe("Café Especial", 8.00));
        leblanc.adicionarCafe(new CafeGourmet("Café Especial Bleach Ichigo Kurosaki", 10.00, 4.50));
        leblanc.abrirCafeteria();
    }
}
