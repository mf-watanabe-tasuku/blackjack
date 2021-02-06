require './user'

class Dealer < User
  def show_start_card
    next_card = @cards[0]
    [next_card[:mark], next_card[:num]].join(" ")
  end
end