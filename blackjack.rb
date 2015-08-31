require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'

# YOUR CODE HERE
# objects: card, deck, hand
# 1. Player gets dealt two cards
# - Deck object needs to deal two card objects
# - Hand object needs to hold cards
deck = Deck.new
player_hand = Hand.new
player_hand.cards += deck.draw_two
puts "Player Dealt"
puts "Cards: #{player_hand.cards.map(&:value).inspect}"
puts "Score: #{player_hand.score}"
# 2a. Player sees score, count value of all cards except Ace
# - hand#score returns total score
# - card#numeric_value returns integer
# - Face cards count as 10
# - Aces default to 1
# 2b. Player determines value of Aces for hand
# - For each ace, determine if changing value to 11 does not bust

# 3. Player decides to hit or stand, if hit add a card to the hand
# 4. Repeat step 3 until player busts or stands
  # player_input = nil
  # until player_input == "S" || hand.score > 21
    # puts "HIt"
    # player_input =  gets.chomp
    # if player_input == "H"
      # hand.cards << deck.draw!
    # end
  # end
# 5. Print if player busts

# 6. If Player does not bust, deal the dealer, start dealers turn.
  def hit_or_stand(deck, hand, dealer = false)
    player_input = nil
    until player_input == "S" || hand.score > 21
      if dealer
        if hand.score < 17
          player_input = "H"
        else
          player_input = "S"
        end
      else
        puts "Hit or Stand (H/S)"
        player_input = gets.chomp
      end
      if player_input == "H"
        hand.cards << deck.draw!
      end
      puts "Cards: #{hand.cards.map(&:value).inspect}"
      puts "Score: #{hand.score}"
    end
  end
  hit_or_stand(deck, player_hand)
  if player_hand.score <= 21
    dealer_hand = Hand.new
    dealer_hand.cards += deck.draw_two
    puts "Dealer Dealt"
    puts "Cards: #{dealer_hand.cards.map(&:value).inspect}"
    puts "Score: #{dealer_hand.score}"
    hit_or_stand(deck, dealer_hand, true)
  end
# 7. Automate the dealer
# 8. Determine Winner

if player_hand.score > 21
  puts "Player busts. Dealer Wins"
elsif dealer_hand.score > 21
  puts "Dealer Busts. Player Wins"
elsif dealer_hand.score > player_hand.score
  puts "Dealer Wins"
elsif player_hand.score > dealer_hand.score
  puts "Player Wins"
else
  puts "Tie!"
end

# YOUR CODE HERE
# objects: card, deck, hand
# 1. Player gets dealt two cards
# - Deck object needs to deal two card objects
# - Hand object needs to hold cards
# 2a. Player sees score
# - card#numeric_value returns integer
# - Face cards count as 10
# - Aces default to 1
# - hand#score returns total score
# 2b. Player determines value of Aces for hand
# - For each ace, determine if changing value to 11 does not bust
# 3. Player decides to hit or stand, if hit add a card to the hand
# 4. Repeat step 3 until player busts or stands
# 5. Print if player busts
# 6. If Player does not bust, deal cards to start dealers turn.
# 7. Automate the dealer
# - make method flexible for both player and dealer
# 8. Determine Winner
