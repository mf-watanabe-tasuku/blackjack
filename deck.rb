class Deck
  CARD_MARKS = ["❤︎", "♠︎", "◆", "♣︎"]
  CARD_NUMS = [ "A", *"2".."10", "J", "Q", "K" ]

  attr_reader :cards

  def initialize
    @cards = []
    CARD_MARKS.each do |mark|
      CARD_NUMS.each do |num|
        @cards.push({mark: mark, num: num})
      end
    end
    @cards.shuffle!
  end
end