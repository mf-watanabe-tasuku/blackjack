require './spec/spec_helper'
require './lib/dealer'
require './lib/deck'

RSpec.describe "Dealerクラス" do
  context 'Dealer initialized' do
    let(:dealer) { Dealer.new }
    let(:deck) { Deck.new }
    let(:dealer_cards) { dealer.deal_card(deck) }

    it 'Dealerインスタンスが生成される'  do
      expect(dealer).not_to be_nil
    end

    it 'deal_cardメソッド後に手札が2枚になる' do
      expect(dealer_cards.length).to eq(2)
    end

    it 'show_start_cardメソッドで手札を一枚見せる' do
      card = dealer_cards[0]
      result = [card[:mark], card[:num]].join(' ')
      expect(dealer.show_start_card).to eq(result)
    end
  end
end