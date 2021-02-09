require './spec/spec_helper'
require './lib/user'

RSpec.describe "Userクラス" do

  it 'Userインスタンスを生成できる'  do
    user = User.new
    expect(user).not_to be_nil
  end

  context 'user_test' do
    user = User.new
    deck = Deck.new

    it 'deal_cardメソッドを呼び出すと手札が生成される' do
      expect { user.deal_card(deck) }.to change{ user.cards }
    end

    it 'draw_cardメソッドを呼び出すと手札が1枚増える' do
      expect { user.draw_card(deck) }.to change { user.cards.length }.by(1)
    end
  end
end