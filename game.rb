class Game
  def initialize
    puts "カードを配ります"
  end

  def judge_game(player, dealer)
    p_score = player.get_score()
    d_score = dealer.get_score()
    p_card_count = player.cards.length
    d_card_count = dealer.cards.length

    score_and_card_count = [p_score, d_score, p_card_count, d_card_count]

    result =  if conditions_for_winning(*score_and_card_count)
                "あなたの勝ちです！"
              elsif conditions_for_losing(*score_and_card_count)
                "あなたの負けです..."
              else
                "勝負は引き分けです"
              end
    puts result
  end

  def conditions_for_winning(p_score, d_score, p_card_count, d_card_count)
    p_score <= 21 && p_score > d_score ||
    p_score == 21 && d_score == 21 && p_card_count < d_card_count
  end

  def conditions_for_losing(p_score, d_score, p_card_count, d_card_count)
    p_score > 21 && d_score <= 21 ||
    p_score > 21 && d_score > 21 ||
    p_score <= 21 && d_score <= 21 && p_score < d_score ||
    p_score == 21 && d_score == 21 && p_card_count > d_card_count
  end

  def ask_repeat_game
    puts "ゲームを繰り返しますか？(y/n)"
    print "入力してください: "
    select_restart = gets.chomp

    main_flow() if select_restart == 'y'
    return if select_restart == 'n'

    puts "入力内容が正しくありません。再度入力してください。"
    ask_repeat_game()
  end
end