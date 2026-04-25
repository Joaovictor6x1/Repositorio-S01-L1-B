# Composição: MicroondasTelefone criado DENTRO do LabRegistro
class MicroondasTelefone
  def ativar
    puts "Banana Verde detectada! O Microondas-Telefone (nome provisório) está operando!"
  end
end

# Agregação: Relatorio existe independente do LabRegistro
class Relatorio
  attr_reader :nome_projeto, :autor

  def initialize(nome_projeto, autor)
    @nome_projeto = nome_projeto
    @autor = autor
  end
end

# Classe principal
class LabRegistro
  def initialize
    @microondas = MicroondasTelefone.new  # Composição: nasce junto
    @registros = []                        # Array vazio de relatórios
  end

  def adicionar_registro(nome_projeto, autor)
    @microondas.ativar                              # i. ativa o microondas
    @registros << Relatorio.new(nome_projeto, autor) # ii. cria e adiciona o relatório
  end

  def listar_experimentos
    puts "\n📋 Experimentos registrados:"
    puts "-" * 35
    @registros.each do |r|
      puts "Projeto: #{r.nome_projeto} | Autor: #{r.autor}"
    end
  end
end

# Main
lab = LabRegistro.new

lab.adicionar_registro("KRR", "Okabe Rintaro")
lab.adicionar_registro("CERN Hack", "Makise Kurisu")
lab.adicionar_registro("D-Mail", "Itaru Hashida")

lab.listar_experimentos
