require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'

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

def play_blackjack
  deck = Deck.new
  player_hand = Hand.new
  player_hand.cards += deck.draw!(2)
  puts "Player initial cards #{player_hand.cards.map(&:value).inspect}"
  puts "Player initial score #{player_hand.score}"

  def turn(hand, deck, dealer = false)
    player_input = nil
    until player_input == "s" || hand.score > 21
      if dealer && hand.score < 17
        player_input = "h"
      elsif dealer
        player_input = "s"
      else
        puts "Hit or Stand? (h/s)"
        player_input = gets.chomp
      end
      if player_input == "h"
        hand.cards += deck.draw!(1)
        puts "Player initial cards #{hand.cards.map(&:value).inspect}"
      else
        puts "Player Stands"
      end
    end
    puts "Player cards at end of turn: #{hand.cards.map(&:value).inspect}"
  end

  turn(player_hand, deck)

  if player_hand.score <= 21
    dealer_hand = Hand.new
    dealer_hand.cards += deck.draw!(2)
    puts "Dealer initial cards #{dealer_hand.cards.map(&:value).inspect}"
    puts "Dealer initial score #{dealer_hand.score}"
    turn(dealer_hand, deck, true)
  end

  if player_hand.score > 21
    puts "Player busts"
  elsif dealer_hand.score > 21
    puts "Dealer busts"
  elsif player_hand.score > dealer_hand.score
    puts "Player wins"
  elsif dealer_hand.score > player_hand.score
    puts "Dealer wins"
  else
    puts "Tie"
  end
end

class Blackjack
  attr_accessor :user, :current_hand
  attr_reader :deck, :player_hand, :dealer_hand
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @current_hand = nil
    @user = "Player"
  end

  def play
    player_turn
    dealer_turn unless player_hand.score > 21
    determine_winner
  end

  def player_turn
    puts "Player Turn"
    self.user = "Player"
    self.current_hand = player_hand
    turn
  end

  def dealer_turn
    puts "\nDealer Turn"
    self.user = "Dealer"
    self.current_hand = dealer_hand
    turn
  end

  def turn
    deal_user
    user_input = nil
    until user_input == "s" || current_hand.score > 21
      user_input = get_user_input
      if user_input == "h"
        current_hand.cards += deck.draw!(1)
        puts display_user_hand
      end
    end
  end

  def deal_user
    current_hand.cards += deck.draw!(2)
    puts display_user_hand
  end

  def display_user_hand
    displayed_hand = "#{user} cards #{current_hand.cards.map(&:value).inspect}\n"
    displayed_hand += "#{user} score #{current_hand.score}"
  end

  def get_user_input
    if user == "Player"
      puts "Hit or Stand? (h/s)"
      user_input = gets.chomp
    else
      user_input = current_hand.score < 17 ? "h" : "s"
    end
    user_input
  end

  def determine_winner
    if player_hand.score > 21
      puts "\nPlayer busts"
    elsif dealer_hand.score > 21
      puts "\nDealer busts"
    elsif player_hand.score > dealer_hand.score
      puts "\nPlayer wins"
    elsif dealer_hand.score > player_hand.score
      puts "\nDealer wins"
    else
      puts "\nTie"
    end
  end
end

# play_blackjack
Blackjack.new.play
