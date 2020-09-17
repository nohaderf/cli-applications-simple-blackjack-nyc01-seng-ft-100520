#This method uses puts to output the message: "Welcome to the Blackjack Table".

def welcome
  puts "Welcome to the Blackjack Table"
end


# This method generates and returns a random number between 1 and 11.

def deal_card
  rand(1...12)
end

# This method accepts an argument of a number
# puts out the phrase "Your cards add up to #{card_total}". 

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end



# This method asks the user for input by outputting the phrase "Type 'h' to hit or 's' to stay".

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end



# Use the gets method to capture the user's input

def get_user_input
  gets.strip
end


# This method takes in an argument of a number, which will be a player's card total, 
# and outputs the message "Sorry, you hit #{card_total}. Thanks for playing!"

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end



# Represents the first round of the game for a given player. 
# It should call on the deal_card method twice
# Use the display_card_total method to puts out the sum and then return the sum. 
# This method will, therefore, call on two other helper methods, deal_card and display_card_total, 
# which takes in an argument of the sum of both invocations of deal_card.

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  card_total
end


# Takes in an argument of the player's current card total. 
# Set up your hit? method to take in an argument of a number.
# Then, the method should use the prompt_user method to prompt the user for input 
#   and the get_user_input method to get and store the user's input. 
# If the player's input is 's', we don't deal a new card. 
# If the player's input is 'h', we do need to deal a new card. 
#   In this case, use the deal_card method to deal a new card 
#   and increment the player's card total by whatever number is returned by deal_card.
# If the player's input is neither 'h' nor 's', 
#   call on the invalid_command method to output the phrase "Please enter a valid command". 
#   Then, call on the prompt_user method again to remind your user what a valid command is.

def hit?(card_total)
  prompt_user
  user_input = get_user_input
  if user_input == "h"
    card_total += deal_card
  elsif user_input == "s"
    card_total
  else
    invalid_command
    prompt_user
    get_user_input
  end
end

# To output the phrase "Please enter a valid command". 
def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

# Welcome the user
# Deal them their first two cards, i.e. their initial_round
# Ask them if they want to hit or stay
# If they want to stay, ask them again!
# If they want to hit, deal another card
# Display the new total
# If their card total exceeds 21, the game ends.

def runner
  welcome
  card_total = initial_round
  until card_total > 21
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end
