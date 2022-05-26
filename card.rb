class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def description
    "#{@rank} of #{@suit}"
  end
end
