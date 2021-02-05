require './deck'
require './card'
require './game'
require './player'
require './dealer'

puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
puts "ブラックジャックへようこそ"
puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"

def main
  # インスタンスを初期化
  game = Game.new
  deck = Deck.new
  player = Player.new
  dealer = Dealer.new

  # 手札を配る (Deckクラス- deal_cardsメソッド)
  player.deal_card(deck)
  dealer.deal_card(deck)

  # 両者のカードをチェック
  player_cards = player.show_cards()
  dealer_card = dealer.show_start_card()
  puts "あなたの手札: " + player_cards
  puts "ディーラーの手札: " + dealer_card

  puts "あなたのターンです"

  while true do
    player.show_info()

    player.select_draw_card?() ? player.draw_card(deck) : break

    player_score = player.get_score()

    if player_score == 21
      puts "素晴らしい！手札の合計が21なのでディーラーのターンになります"
      break
    elsif player_score > 21
      player.show_info()
      game.judge_game(player, dealer)
      main() if game.repeat_game?()
      return
    end
  end

  puts "ディーラーのターンです"

  while true do
    dealer.show_info()

    dealer_score = dealer.get_score()

    if dealer_score > 21
      puts "手札の合計が21を超えました。あなたの勝ちです。"
      main() if game.repeat_game?()
      return
    elsif dealer_score >= 17
      puts "手札の合計が17以上なのでストップです。"
      game.judge_game(player, dealer)
      main() if game.repeat_game?()
      return
    end

    puts "ディーラーがカードを引きます"
    dealer.draw_card(deck)
  end
end

main()

puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
puts "Thank you for playing！また遊んでね！"
puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"