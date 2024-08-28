class Player
  attr_reader :name, :symbol
  attr_accessor :fields

  def initialize(name, symbol, fields)
    @name = name
    @symbol = symbol
    @fields = fields
  end
end