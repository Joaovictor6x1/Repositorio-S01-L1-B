using System;

namespace ExercicioGondor
{
    class CombatenteAliado
    {
        private string nome;
        private string linhagem;
        private string patente;

        public CombatenteAliado(string nome, string linhagem, string patente)
        {
            this.nome = nome;
            this.linhagem = linhagem;
            this.patente = patente;
        }

        public void ApresentarUnidade()
        {
            Console.WriteLine("    Combatente Aliado    ");
            Console.WriteLine($"Nome: {nome}");
            Console.WriteLine($"Linhagem: {linhagem}");
            Console.WriteLine($"Patente: {patente}");
            Console.WriteLine();
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            CombatenteAliado combatente1 = new CombatenteAliado("Fabricio Bruno", "Humano", "Capitão");
            CombatenteAliado combatente2 = new CombatenteAliado("Montillo", "Anão", "Guerreiro");
            CombatenteAliado combatente3 = new CombatenteAliado("Fábio", "Elfo", "Arqueiro");

            combatente1.ApresentarUnidade();
            combatente2.ApresentarUnidade();
            combatente3.ApresentarUnidade();
        }
    }
}
