class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def score
    sum = 0
    ace_default = false
    cards.each do |card|
      sum += card.numeric_value
      if card.ace?
        ace_default = true
      end
    end
    if ace_default && sum + 10 < 21
      sum += 10
    end
    sum
  end
end
