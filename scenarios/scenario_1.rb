require './deck.rb'
require './format/style.rb'

puts <<~TEST

============= SCENARIO 1 ============
user draws specified number of times
=====================================
TEST

# read description and raises error if no more cards in deck
def validate_size(deck)
  raise 'ERROR CAUGHT: DECK HAS NO CARDS REMAINING!' if deck.empty?
  puts "You drew a '#{yield.description}'!"
end
  
begin
  deck = Deck.new
  deck.shuffle

  # draws one card
  headers("1. Single Draw")
  validate_size(deck){ deck.draw }

  # overdraws and requires rescue from raised exception
  headers("2. Attempt to Overdraw")
  52.times do 
    validate_size(deck){ deck.draw }
  end

rescue => e
  failed(e)
end
