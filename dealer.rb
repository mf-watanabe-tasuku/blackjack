require './user'

class Dealer < User
  def show_start_card
    card = self.cards[0]
    card[:mark] + " " + card[:num]
  end
end