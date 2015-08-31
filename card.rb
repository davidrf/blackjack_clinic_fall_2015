class PlayingCard
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def name
    "#{@value}#{@suit}"
  end

  def numeric_value
    if value.to_i == 0
      hash = { "K" => 10, "Q" => 10, "J" => 10, "A" => 1 }
      hash[value]
    else
      value.to_i
    end
  end
end
