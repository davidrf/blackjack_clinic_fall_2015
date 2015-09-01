require_relative 'card'
require_relative 'deck'

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
