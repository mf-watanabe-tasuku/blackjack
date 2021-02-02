class Game
  def initialize
    @player_total, @dealer_total = 0, 0
    @player_card_count, @dealer_card_count = 2, 2
  end

  def add_total(person, card)
    if person == "player"
      @player_total += card
      @player_card_count += 1
    else
      @dealer_total += card
      @dealer_card_count += 1
    end
  end

  def judge_game
    if @player_total <= 21 && @player_total > @dealer_total ||
       @player_total == 21 && @dealer_total == 21 && @player_card_count < @dealer_card_count
      "あなたの勝ちです！"
    elsif @player_total > 21 && @dealer_total <= 21 ||
          @player_total > 21 && @dealer_total > 21 ||
          @player_total == 21 && @dealer_total == 21 && @player_card_count > @dealer_card_count
      "あなたの負けです..."
    else
      "勝負は引き分けです"
    end
  end

  def repeat_game?
    puts "ゲームを繰り返しますか？(y/n)"
    print "入力してください: "
    select_restart = gets.chomp
  
    if select_restart == 'y'
      return true
    elsif select_restart == 'n'
      return false
    else
      puts "入力内容が正しくありません"
      repeat_game?()
    end
  end
end