require './user'

class Player < User
  def show_start_cards
    cards = self.cards.inject("") { |text, card| text + card + " " }
    puts "プレイヤーのカード: " + cards
  end
end