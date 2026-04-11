using System;
using System.Collections.Generic;

// Classe ReliquiaMagica
class ReliquiaMagica
{
    public string NomeItem;

    public ReliquiaMagica(string nomeItem)
    {
        NomeItem = nomeItem;
    }
}

// Classe BauDeReliquias - COMPOSICAO (pertence à Maga)
class BauDeReliquias
{
    private List<ReliquiaMagica> reliquias = new List<ReliquiaMagica>();

    public void GuardarItem(ReliquiaMagica item)
    {
        reliquias.Add(item);
        Console.WriteLine("Item guardado no bau: " + item.NomeItem);
    }
}

// Classe ItemDeAcampamento
class ItemDeAcampamento
{
    public string NomeItem;

    public ItemDeAcampamento(string nomeItem)
    {
        NomeItem = nomeItem;
    }
}

// Classe Maga
class Maga
{
    public string Nome;

    // COMPOSICAO - BauDeReliquias criado dentro da propria classe
    private BauDeReliquias bau = new BauDeReliquias();

    // AGREGACAO - lista de itens recebida de fora
    private List<ItemDeAcampamento> kitAcampamento;

    public Maga(string nome, List<ItemDeAcampamento> itens)
    {
        Nome = nome;
        kitAcampamento = itens;
    }

    public void AdicionarReliquia(ReliquiaMagica reliquia)
    {
        bau.GuardarItem(reliquia);
    }

    public void MostrarItensAcampamento()
    {
        Console.WriteLine("\nItens de acampamento de " + Nome + ":");
        foreach (ItemDeAcampamento item in kitAcampamento)
        {
            Console.WriteLine("- " + item.NomeItem);
        }
    }
}

class Program
{
    static void Main()
    {
        // Criando itens de acampamento (existem independente da Maga)
        List<ItemDeAcampamento> itens = new List<ItemDeAcampamento>();
        itens.Add(new ItemDeAcampamento("Saco de Dormir"));
        itens.Add(new ItemDeAcampamento("Pote de Cozinha"));

        // Instanciando a Maga Frieren
        Maga frieren = new Maga("Frieren", itens);

        // Adicionando reliquias ao bau
        frieren.AdicionarReliquia(new ReliquiaMagica("Anel de Prata"));
        frieren.AdicionarReliquia(new ReliquiaMagica("Grimorio Antigo"));

        // Mostrando itens de acampamento
        frieren.MostrarItensAcampamento();
    }
}
