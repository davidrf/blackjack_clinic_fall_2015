class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def score
    sum = 0
    ace_count = 0
    @cards.each do |card|
      sum += card.numeric_value
      if card.numeric_value == 1
        ace_count += 1
      end
    end
    ace_count.times do |ace|
      if sum + 10 <= 21
        sum += 10
      end
    end
    sum
  end
end
