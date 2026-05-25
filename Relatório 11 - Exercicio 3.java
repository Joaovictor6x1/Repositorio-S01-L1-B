 import java.util.HashMap;

interface Rastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;
    private int intensidade;

    public Poder(String nome, int intensidade) {
        this.nome = nome;
        this.intensidade = intensidade;
    }

    public String getNome() { return nome; }
    public int getIntensidade() { return intensidade; }
}

abstract class Entidade {
    private String nome;

    public Entidade(String nome) {
        this.nome = nome;
    }

    public String getNome() { return nome; }
}

class Alien extends Entidade implements Rastreavel {
    private Poder poder;

    public Alien(String nome) {
        super(nome);
        this.poder = new Poder("Bankai", 98);
    }

    @Override
    public String obterCoordenadas() {
        return "Las Noches [Poder: " + poder.getNome() + " - " + poder.getIntensidade() + "]";
    }
}

class Youkai extends Entidade implements Rastreavel {
    private Poder poder;

    public Youkai(String nome) {
        super(nome);
        this.poder = new Poder("Reiatsu", 87);
    }

    @Override
    public String obterCoordenadas() {
        return "Cidade de Karakura, Soul Society [Poder: " + poder.getNome() + " - " + poder.getIntensidade() + "]";
    }
}

class RegistroOculto {
    private HashMap<String, Entidade> mapa;

    public RegistroOculto() {
        this.mapa = new HashMap<>();
    }

    public void registrarEntidade(Entidade e) {
        if (mapa.containsKey(e.getNome())) {
            System.out.println("Aviso: " + e.getNome() + " já está registrado");
        } else {
            mapa.put(e.getNome(), e);
            System.out.println(e.getNome() + " registrado com sucesso");
        }
    }

    public void listarEntidades() {
        System.out.println("\n    Entidades Registradas     ");
        for (Entidade e : mapa.values()) {
            System.out.println(e.getNome() + "   " + ((Rastreavel) e).obterCoordenadas());
        }
    }
}

public class Main {
    public static void main(String[] args) {
    Alien ichigoKurosaki = new Alien("Ichigo Kurosaki");
    Alien aizen = new Alien("Aizen");
    Youkai kenpachiZaraki = new Youkai("Kenpachi Zaraki");
    Youkai yamamoto = new Youkai("Yamamoto");

    RegistroOculto registro = new RegistroOculto();
    registro.registrarEntidade(ichigoKurosaki);
    registro.registrarEntidade(aizen);
    registro.registrarEntidade(kenpachiZaraki);
    registro.registrarEntidade(yamamoto);
    registro.registrarEntidade(ichigoKurosaki); // duplicado
    registro.listarEntidades();
} // <- fecha aqui
}
