require './card'

class User

  attr_accessor :cards

  def deal_card(card_deck)
    self.cards = card_deck.slice!(0, 2)
  end

  def draw_card(card_deck)
    self.cards << card_deck.cards.slice!(0, 1)[0]
  end

  def show_current_cards()
    self.cards.inject("") { |text, card| text + card[:mark] + " " + card[:num] + " " }
  end

  def calculate_score(cards)
    cards.inject(0) { |score, card| score + Card.get_card_strength(card) }
  end
end