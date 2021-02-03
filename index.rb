require './deck'
require './card'
require './game'
require './player'
require './dealer'

# 初期化
game = Game.new
player = Player.new
dealer = Dealer.new
# カードを生成する
deck = Deck.new
# 山札を混ぜる (Deckクラス- shuffle_cardsメソッド)
deck.shuffle_cards!()
# 手札を配る (Deckクラス- deal_cardsメソッド)
player.deal_card(deck.cards)
dealer.deal_card(deck.cards)

puts "==================="

# プレイヤーとディーラーのカードをチェック (Dealderクラス - show_cardメソッド)
player.show_current_cards()
player_score = player.calculate_score(player.cards)

player_card = player.show_current_cards()
puts "あなたのカード: " + player_card

dealer_card = dealer.show_start_cards()
puts "ディーラーのカード: " + dealer_card


player.player_turn(dealer, deck, game)

# dealer.dealer_turn(deck, game)

# ディーラーは17以上になるまでカードを引く(バーストしたらあなたの勝ち) (Dealerクラス - draw_cardメソッド)
# dealer.draw_card()
# ゲームの結果を表示する (Gameクラス - judge_game_resultメソッド)
# もう一度プレーするか選択を入力させる (Gameクラス - repeat_gameメソッド)
# 「y」ならもう一度プレー、「n」ならゲームをやめる