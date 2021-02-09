require './lib/user'

class Player < User
  def select_draw_card?
    puts "カードを引きますか？(y/n)"
    print "入力してください: "
    select_draw_or_stop = gets.chomp

    return true if select_draw_or_stop == 'y'
    return false if select_draw_or_stop == 'n'

    puts "入力内容が正しくありません。もう一度入力してください。"
    select_draw_card?
  end
end