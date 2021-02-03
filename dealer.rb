require './user'

class Dealer < User
  def show_start_cards
    self.cards[0][:mark] + " " + self.cards[0][:num]
  end

  def dealer_turn(player, deck, game)
    puts "==================="
    puts "ディーラーのターンです"
    puts "==================="

    loop {
      puts "ディーラーのカード: " + self.show_current_cards()
      dealer_score = self.calculate_score(self.cards)
      puts "現在のディーラーのスコア: " + dealer_score.to_s

      puts "==================="

      if dealer_score > 21
        puts "手札の合計が21を超えました。あなたの勝ちです。"
        game.end_game()
        return
      elsif dealer_score >= 17
        puts "合計が17以上になったのでここでストップです。"
        game_result = game.judge_game(player, self)
        puts game_result
        puts "==================="
        game.repeat_game(player, self, deck, game)
        return
      else
        puts "ディーラーがカードを引きます"
        self.draw_card(deck)
      end
    }
  end
end