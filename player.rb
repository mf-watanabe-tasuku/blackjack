require './user'

class Player < User
  def player_turn(dealer, deck, game)
    puts "==================="
    puts "あなたのターンです"
    puts "==================="

    loop {
      puts "あなたのカード: " + self.show_current_cards()

      player_score = self.calculate_score(self.cards)
      puts "あなたのスコア: " + player_score.to_s

      print "カードを引きますか？(y/n): "
      input = gets.chomp

      # 「y」ならカードを引く
      if input == "y"
        self.draw_card(deck)
        puts "==================="

        player_score = self.calculate_score(self.cards)
        # バーストしたらあなたの負け
        if player_score > 21
          player_score = self.calculate_score(self.cards)
          puts "現在のあなたのスコア: " + player_score.to_s
          puts "==================="
          puts "手札の合計が21を超えました。あなたの負けです。"
          puts "==================="
          game.repeat_game(self, dealer, deck, game)
          return
        end
      elsif input == "n"
        dealer.dealer_turn(self, deck, game)
        return
      end
    }
  end
end