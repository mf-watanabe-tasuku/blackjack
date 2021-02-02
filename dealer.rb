require './user'

class Dealer < User
  def show_start_cards
    cards = self.cards[0]
    puts "ディーラーのカード: " + cards
  end
end