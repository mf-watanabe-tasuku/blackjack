class Deck
  CARD_MARKS = ["❤︎", "♠︎", "◆", "♣︎"]
  CARD_NUMS = [ "A", *"2".."10", "J", "Q", "K" ]

  attr_reader :cards

  def initialize
    @cards = []
    Array(CARD_MARKS).product(CARD_NUMS).each { |mark, num| @cards << { mark: mark, num: num } }.shuffle!
  end
end