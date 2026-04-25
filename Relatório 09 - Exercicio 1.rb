# Classe Base
class BebidaAfterlife
  attr_accessor :nome  # getter e setter automático para nome

  def initialize(nome, custo_base)
    @nome = nome
    self.custo_base = custo_base  # usa o setter para validar
  end

  # Getter manual para custo_base
  def custo_base
    @custo_base
  end

  # Setter manual com validação
  def custo_base=(valor)
    if valor > 0
      @custo_base = valor
    else
      puts "Erro: custo_base deve ser maior que zero!"
    end
  end

  def preco_total
    @custo_base
  end

  def to_string
    "Bebida: [#{@nome}] | Valor Final: $#{preco_total}"
  end
end

# Subclasse com herança
class DrinkIconico < BebidaAfterlife
  def initialize(nome, custo_base, nivel_notoriedade)
    super(nome, custo_base)           # chama o initialize da classe pai
    @nivel_notoriedade = nivel_notoriedade
  end

  # Polimorfismo: sobrescreve preco_total
  def preco_total
    @custo_base + (@nivel_notoriedade * 8)
  end

  def to_string
    "Bebida: [#{@nome}] | Valor Final: $#{preco_total}"
  end
end

# Main: instanciando os 3 objetos em uma lista
drinks = [
  DrinkIconico.new("Old Fashioned do Al Capone", 15, 10),
  DrinkIconico.new("Negroni da Carmela", 12, 7),
  BebidaAfterlife.new("Cerveja Comum", 8)
]

# Exibindo a descrição de cada drink
drinks.each { |d| puts d.to_string }
