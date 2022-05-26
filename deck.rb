require './card.rb'

class Deck
  attr_reader :cards

  SUITS = %w(Clubs Diamonds Hearts Spades)
  RANKS = [*2..10, "Jack", "Queen", "King", "Ace"]

  # initialize with private card constructor
  def initialize(deck: default)
    @cards = deck
  end

  def draw
    @cards.shift
  end

  # see next card
  def cheat
    @cards.first
  end

  # re-initializes deck & randomizes the order
  def shuffle
    @cards = default.shuffle!
  end

  # allows user to stack a rank (j/q/k/a) on top
  def stack(select: "Ace")
    selections, @cards = @cards.partition{ |card| card.rank == select }
    selections.each{ |card| @cards.unshift(card) }
  end

  # basic deck cut
  def cut
    @cards.rotate!(@cards.count / 2)
  end

  # view current deck size
  def size
    @cards.length
  end

  # check if deck is empty
  def empty?
    @cards.length == 0
  end

  private

    def default
      SUITS.product(RANKS).map { |suit, rank| Card.new(rank, suit) }
    end
end
