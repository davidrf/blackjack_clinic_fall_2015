class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def score
    sum = 0
    ace_present = false
    cards.each do |card|
      sum += card.numeric_value
      if card.ace?
        ace_present = true
      end
    end
    if ace_present && sum + 10 <= 21
      sum += 10
    end
    sum
  end
end
