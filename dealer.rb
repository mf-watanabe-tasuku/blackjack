require './user'

class Dealer < User
  def show_start_cards
    self.cards.map { |card| card[:mark] + " " + card[:num] }[0]
  end
end