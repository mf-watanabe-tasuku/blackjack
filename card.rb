class Card
  CARD_STRENGTH = { "A" => 1,
                    "2" => 2,
                    "3" => 3,
                    "4" => 4,
                    "5" => 5,
                    "6" => 6,
                    "7" => 7,
                    "8" => 8,
                    "9" => 9,
                    "10" => 10,
                    "J" => 10,
                    "Q" => 10,
                    "K" => 10 
                  }

  def self.get_card_strength(card)
    CARD_STRENGTH[card[:num]]
  end
end