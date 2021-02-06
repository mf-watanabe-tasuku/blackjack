require './card'

class User

  attr_reader :cards

  def initialize
    @cards
  end

  def deal_card(deck)
    @cards = deck.cards.slice!(0, 2)
  end

  def draw_card(deck)
    @cards << deck.cards.slice!(0)
  end

  def show_cards
    @cards.inject("") { |text, card| text + "#{card[:mark]} #{card[:num]} " }
  end

  def get_score
    @cards.inject(0) { |sum, card| sum + Card.get_card_strength(card) }
  end

  def show_info
    name = self.class == Player ? "あなた" : "ディーラー"

    puts "#{name}の手札: " + self.show_cards
    puts "#{name}のスコア: " + self.get_score.to_s
  end
end