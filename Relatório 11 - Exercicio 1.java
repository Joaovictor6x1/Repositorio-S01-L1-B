import java.util.ArrayList;

abstract class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() { return nome; }
    public int getIdade() { return idade; }
    public void setNome(String nome) { this.nome = nome; }

    public abstract void apresentar();
}

class Mago extends Personagem {
    public Mago(String nome, int idade) {
        super(nome, idade);
    }

    @Override
    public void apresentar() {
        System.out.println("Sou " + getNome() + ", um mago que faz o que eu quero, tipo te levar pra Coreia do Sul");
    }
}

class Divisao {
    private String nome;
    private String funcao;

    public Divisao(String nome, String funcao) {
        this.nome = nome;
        this.funcao = funcao;
    }

    public String getNome() { return nome; }
    public String getFuncao() { return funcao; }
}

class CasteloAnimado {
    private ArrayList<Divisao> divisoes;

    public CasteloAnimado(ArrayList<Divisao> divisoes) {
        this.divisoes = divisoes;
    }

    public void adicionarDivisao(Divisao d) {
        divisoes.add(d);
    }

    public void listarDivisoes() {
        for (Divisao d : divisoes) {
            System.out.println("Cômodo: " + d.getNome() + " | Função: " + d.getFuncao());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Mago howl = new Mago("Howl", 27);
        howl.apresentar();

        ArrayList<Divisao> lista = new ArrayList<>();
        lista.add(new Divisao("Quarto", "Descanso"));
        lista.add(new Divisao("Laboratório", "Alquimia"));

        CasteloAnimado castelo = new CasteloAnimado(lista);
        castelo.adicionarDivisao(new Divisao("Sala de Entrada", "Vai pra Coreia do Sul"));
        castelo.listarDivisoes();
    }
}
