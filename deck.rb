class Deck
  CARD_MARKS = ["❤︎", "♠︎", "◆", "♣︎"]
  CARD_NUMS = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K" ]

  attr_accessor :cards

  def initialize
    @cards = []
    CARD_MARKS.each do |mark|
      CARD_NUMS.each do |num|
        card = mark + " " + num
        @cards.push(card)
      end
    end
  end

  def shuffle_cards!
    self.cards.shuffle!
  end
end