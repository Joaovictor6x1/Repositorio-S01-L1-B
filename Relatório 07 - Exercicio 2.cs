using System;
using System.Collections.Generic;

class CriaturaPokemon
{
    public string Especie;

    public virtual void ExecutarMovimento()
    {
        Console.WriteLine("O Pokemon executa um movimento generico!");
    }
}

class TipoFogo : CriaturaPokemon
{
    public override void ExecutarMovimento()
    {
        Console.WriteLine(Especie + " lanca uma rajada de chamas!");
    }
}

class TipoAgua : CriaturaPokemon
{
    public override void ExecutarMovimento()
    {
        Console.WriteLine(Especie + " dispara uma bolha de agua!");
    }
}

class Program
{
    static void Main()
    {
        List<CriaturaPokemon> lista = new List<CriaturaPokemon>();

        TipoFogo scorbunny = new TipoFogo();
        scorbunny.Especie = "Scorbunny";

        TipoAgua greninja = new TipoAgua();
        greninja.Especie = "Greninja";

        lista.Add(scorbunny);
        lista.Add(greninja);

        foreach (CriaturaPokemon p in lista)
        {
            p.ExecutarMovimento();
        }
    }
}
