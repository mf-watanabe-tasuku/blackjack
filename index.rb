require './deck'
require './card'
require './game'
require './player'
require './dealer'

puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
puts "ブラックジャックへようこそ"
puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
puts "ゲームを開始します"
# カードを生成する
deck = Deck.new
# 山札を混ぜる (Deckクラス- shuffle_cardsメソッド)
deck.shuffle_cards!()
# 初期化
game = Game.new
player = Player.new
dealer = Dealer.new
# 手札を配る (Deckクラス- deal_cardsメソッド)
player.deal_card(deck.cards)
dealer.deal_card(deck.cards)
# プレイヤーとディーラーのカードをチェック (Dealderクラス - show_cardメソッド)
player.show_start_cards()
player_score = player.calculate_score(player.cards)
puts "現在のあなたのスコア: " + player_score.to_s

dealer.show_start_cards()
dealer_score = dealer.calculate_score(dealer.cards)
# プレイヤーのターンになる
puts "あなたのターンです"
# カードを引くかどうか、選択を入力してもらう (Player - draw_cardメソッド)
# 「y」ならカードを引く(バーストしたらディーラーの勝ち)
# player.draw_card()
# 「n」ならディーラーのターン
# ディーラーのターンになる
# ディーラーは17以上になるまでカードを引く(バーストしたらあなたの勝ち) (Dealerクラス - draw_cardメソッド)
# dealer.draw_card()
# ゲームの結果を表示する (Gameクラス - judge_game_resultメソッド)
# もう一度プレーするか選択を入力させる (Gameクラス - repeat_gameメソッド)
# 「y」ならもう一度プレー、「n」ならゲームをやめる
puts "ゲームを終了します。"
puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"
puts "Thank you for playing！また遊んでね！"
puts "★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★"