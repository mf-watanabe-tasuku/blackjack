require './card'

class User

  attr_accessor :cards

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

    person_cards = self.show_cards
    person_score = self.get_score

    puts "#{name}の手札: " + person_cards
    puts "#{name}のスコア: " + person_score.to_s
  end
end