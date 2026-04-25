# Classe base abstrata
class Musico
  attr_accessor :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(obra)
    raise NotImplementedError, "#{self.class} deve implementar tocar_partitura!"
  end
end

# Subclasses
class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(obra)
    puts "#{@nome} toca #{obra} com dedos que dançam pelo teclado..."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(obra)
    puts "#{@nome} arranha o arco e faz #{obra} ganhar vida no violino!"
  end
end

# Classe Maestro
class Maestro
  def initialize
    @musicos = []
  end

  def adicionar_musico(musico)
    @musicos << musico
  end

  def iniciar_concerto(obra)
    puts "\n🎼 Iniciando concerto: #{obra}"
    puts "-" * 40
    @musicos.each { |m| m.tocar_partitura(obra) }
  end

  def ajustar_postura(estado)
    @musicos.map { |m| "#{m.nome} está em ritmo #{estado}!" }
  end
end

# Main
maestro = Maestro.new

maestro.adicionar_musico(Pianista.new("Kosei Arima"))
maestro.adicionar_musico(Violinista.new("Kaori Miyazono"))
maestro.adicionar_musico(Pianista.new("Takeshi Aiza"))

maestro.iniciar_concerto("Kreutzer Sonata")

puts "\n🎯 Ajuste de postura:"
status = maestro.ajustar_postura("Allegro")
status.each { |s| puts s }
