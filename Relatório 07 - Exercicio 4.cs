using System;
using System.Collections.Generic;

// Classe base ABSTRATA
abstract class AbominacaoCosmica
{
    public string Nome;

    public abstract void Manifestar();
}

// Classe Shoggoth
class Shoggoth : AbominacaoCosmica
{
    public Shoggoth(string nome)
    {
        Nome = nome;
    }

    public override void Manifestar()
    {
        Console.WriteLine(Nome + ": A massa de protoplasma se arrasta borbulhando, moldando orgaos e olhos conforme avanca!");
    }
}

// Classe CacadorAlado
class CacadorAlado : AbominacaoCosmica
{
    public CacadorAlado(string nome)
    {
        Nome = nome;
    }

    public override void Manifestar()
    {
        Console.WriteLine(Nome + ": A criatura bate suas asas membranosas, mergulhando do vacuo estelar em um voo silencioso!");
    }
}

class Program
{
    static void Main()
    {
        List<AbominacaoCosmica> lista = new List<AbominacaoCosmica>();

        lista.Add(new Shoggoth("Shoggoth"));
        lista.Add(new CacadorAlado("Morte Alada"));

        foreach (AbominacaoCosmica criatura in lista)
        {
            criatura.Manifestar();
            Console.WriteLine();
        }
    }
}
