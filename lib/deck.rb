class Deck
  CARD_MARKS = ["❤︎", "♠︎", "◆", "♣︎"]
  CARD_NUMS = [ "A", *"2".."10", "J", "Q", "K" ]

  attr_reader :cards

  def initialize
    @cards = Array(CARD_MARKS).product(CARD_NUMS).inject([]) { |arr, item| arr << { mark: item[0], num: item[1] } }.shuffle!
  end
end