def game_init
  @player_total, @dealer_total = 0, 0
  @player_card_count, @dealer_card_count = 2, 2
  puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
  puts "ブラックジャックへようこそ"
  puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
  puts "・\n・"
  puts "ゲームを開始します"
  puts "・\n・"
  puts "手札を配ります"
  check_cards()
end

def check_cards
  puts "・\n・"
  puts "======================"
  puts "あなたの手札: ♦︎ Q ❤︎ 4 (合計: #{@player_total}、枚数: #{@player_card_count})"
  puts "ディーラーの手札: ♠ 7"
  puts "======================"
  draw_card()
end

def draw_card
  puts "カードを引きますか?(y/n)"
  print "入力してください: "
  user_input =  gets.chomp

  if user_input == 'y'
    add_total("player", 2)
    check_cards()
  elsif user_input == 'n'
    judge_game()
  else
    puts "・\n・"
    puts "入力内容が正しくありません"
    check_cards()
  end
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
  game_result = if @player_total <= 21 && @player_total > @dealer_total ||
                   @player_total == 21 && @dealer_total == 21 && @player_card_count < @dealer_card_count
                  "あなたの勝ちです！"
                elsif @player_total > 21 && @dealer_total <= 21 ||
                      @player_total > 21 && @dealer_total > 21 ||
                      @player_total == 21 && @dealer_total == 21 && @player_card_count > @dealer_card_count
                  "あなたの負けです..."
                else
                  "勝負は引き分けです"
                end

  puts "・\n・"
  puts game_result
  repeat_game()
end

def repeat_game
  puts "・\n・"
  puts "ゲームを繰り返しますか？(y/n)"
  print "入力してください: "
  select_restart = gets.chomp

  if select_restart == 'y'
    game_init()
  elsif select_restart == 'n'
    finish_game()
  else
    puts "入力内容が正しくありません"
    repeat_game()
  end
end

def finish_game
  puts "\n★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
  puts "Thank you for playing！また遊んでね！"
  puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
end

game_init()