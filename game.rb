class Game
  def initialize
    puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
    puts "ブラックジャックへようこそ"
    puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
    puts "カードを配ります"
  end

  def judge_game(player, dealer)
    player_score = player.calculate_score(player.cards)
    dealer_score = dealer.calculate_score(dealer.cards)
    player_card_count = player.cards.length
    dealer_card_count = dealer.cards.length

    if player_score <= 21 && player_score > dealer_score ||
       player_score == 21 && dealer_score == 21 && 
       player_card_count < dealer_card_count
      "あなたの勝ちです！"
    elsif player_score > 21 && dealer_score <= 21 ||
          player_score > 21 && dealer_score > 21 ||
          player_score <= 21 && dealer_score <= 21 && 
          player_score < dealer_score ||
          player_score == 21 && dealer_score == 21 && player_card_count > dealer_card_count
      "あなたの負けです..."
    else
      "勝負は引き分けです"
    end
  end

  def repeat_game(player, dealer, deck, game)
    loop {
      puts "ゲームを繰り返しますか？(y/n)"
      print "入力してください: "
      select_restart = gets.chomp

      if select_restart == 'y'
        # game = self.initialize()
        player.player_turn(dealer, deck, game)
        return
      elsif select_restart == 'n'
        self.end_game()
        return
      else
        puts "入力内容が正しくありません"
        puts "==================="
      end
    }
  end

  def end_game
    puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
    puts "Thank you for playing！また遊んでね！"
    puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
  end
end