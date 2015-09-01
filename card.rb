class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def name
    "#{@value}#{@suit}"
  end

  def ace?
    "A" == value
  end

  def face_card?
    ["J", "Q", "K", "A"].include?(value)
  end

  def numeric_value
    if face_card?
      if ace?
        1
      else
        10
      end
    else
      value.to_i
    end
  end
end
