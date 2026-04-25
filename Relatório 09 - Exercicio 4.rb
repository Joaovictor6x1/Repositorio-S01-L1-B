# Módulos (interfaces/mixins)
module Localizavel
  def local_atual
    puts "#{@nome} está localizado em: #{@localizacao}"
  end
end

module Perigoso
  def exibir_ameaca
    puts "⚠️  ALERTA: #{@nome} representa uma ameaça! Proceda com cautela."
  end
end

# Classe base
class Pessoa
  attr_reader :nome

  def initialize(nome, localizacao)
    @nome = nome
    @localizacao = localizacao
  end
end

# Testemunha: herda Pessoa + inclui só Localizavel
class Testemunha < Pessoa
  include Localizavel
end

# Suspeito: herda Pessoa + inclui Localizavel E Perigoso
class Suspeito < Pessoa
  include Localizavel
  include Perigoso
end

# Agregação: CenaDoCrime armazena lista de pessoas
class CenaDoCrime
  def initialize
    @pessoas = []
  end

  def adicionar_pessoa(pessoa)
    @pessoas << pessoa
  end

  def listar_todos
    puts "\n👥 Pessoas na cena do crime:"
    puts "-" * 40
    @pessoas.each do |p|
      puts "- #{p.nome} (#{p.class})"
      p.local_atual
    end
  end

  # Introspecção: respond_to? verifica se o objeto tem o método
  def identificar_perigosos
    puts "\n🔍 Identificando suspeitos perigosos..."
    puts "-" * 40
    perigosos = @pessoas.select { |p| p.respond_to?(:exibir_ameaca) }

    if perigosos.empty?
      puts "Nenhum suspeito perigoso encontrado."
    else
      perigosos.each { |p| p.exibir_ameaca }
    end
  end
end

# Main
cena = CenaDoCrime.new

cena.adicionar_pessoa(Testemunha.new("Dr. Watson", "Sala de Estar"))
cena.adicionar_pessoa(Suspeito.new("Professor Moriarty", "Biblioteca"))
cena.adicionar_pessoa(Suspeito.new("Irene Adler", "Corredor"))

cena.listar_todos
cena.identificar_perigosos
