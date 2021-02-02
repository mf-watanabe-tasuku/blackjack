require './card'

class User

  attr_accessor :cards

  def deal_card(card_deck)
    self.cards = card_deck.slice!(0, 2)
  end

  def show_cards
    self.cards.inject("") { |text, card| text + card + " " }
  end

  def draw_card(card_deck)
    card_deck.slice!(0,1)
  end

  def calculate_score(cards)
    cards.inject(0) { |score, card| score + Card.get_card_strength(card) }
  end
end