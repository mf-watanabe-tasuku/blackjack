require './lib/deck'
require './lib/card'
require './lib/game'
require './lib/player'
require './lib/dealer'
require './lib/interval'

puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
puts "ブラックジャックへようこそ"
puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"

def main
  Interval.show_dot

  # インスタンスを初期化
  game = Game.new
  deck = Deck.new
  player = Player.new
  dealer = Dealer.new
  Interval.show_dot

  # 手札を配る (Deckクラス- deal_cardsメソッド)
  player.deal_card(deck)
  dealer.deal_card(deck)

  # 両者のカードをチェック
  player_cards = player.show_cards
  dealer_card = dealer.show_start_card
  puts "あなたの手札: " + player_cards
  puts "ディーラーの手札: " + dealer_card
  Interval.show_dot

  puts "あなたのターンです"
  Interval.show_dot

  while true do
    player.show_info
    Interval.show_dot

    player.select_draw_card? ? player.draw_card(deck) : break
    Interval.show_dot

    player_score = player.get_score

    if player_score == 21
      puts "素晴らしい！手札の合計が21なのでディーラーのターンになります"
      break
    elsif player_score > 21
      player.show_info
      Interval.show_dot

      game.judge_game(player, dealer)
      Interval.show_dot

      return main if game.repeat_game?
      Interval.show_dot

      return
    end
  end

  Interval.show_dot

  puts "ディーラーのターンです"
  Interval.show_dot

  while true do
    dealer.show_info
    Interval.show_dot

    dealer_score = dealer.get_score

    if dealer_score > 21
      puts "手札の合計が21を超えました。あなたの勝ちです。"
      Interval.show_dot

      return main if game.repeat_game?
      Interval.show_dot

      return
    elsif dealer_score >= 17
      puts "手札の合計が17以上なのでストップです。"
      Interval.show_dot

      game.judge_game(player, dealer)
      Interval.show_dot

      return main if game.repeat_game?
      Interval.show_dot

      return
    end

    puts "ディーラーがカードを引きます"
    dealer.draw_card(deck)
    Interval.show_dot
  end
end

main

puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
puts "Thank you for playing！また遊んでね！"
puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"