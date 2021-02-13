require './spec/spec_helper'
require './lib/deck'

RSpec.describe "Deckクラス" do
  it 'Deckインスタンスを生成すると、52枚のカードが生成される' do
    deck = Deck.new
    expect(deck.cards.length).to be(52)
  end

  context 'deck_text' do
    user = User.new
    deck = Deck.new

    it 'deal_cardメソッドでDeckのカードが2枚減る' do
      expect { user.deal_card(deck) }.to change{ deck.cards.length }.by(-2)
    end

    it 'draw_cardメソッドでDeckのカードが1枚減る' do
      expect { user.draw_card(deck) }.to change{ deck.cards.length }.by(-1)
    end
  end
end