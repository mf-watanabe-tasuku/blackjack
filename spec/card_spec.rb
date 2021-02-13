require './spec/spec_helper'
require './lib/card'

RSpec.describe 'Cardクラス' do
  it 'get_card_strengthメソッドでカードの強さが取得できる' do
    card = { mark: "❤︎", num: "7" }
    expect(Card.get_card_strength(card)).to eq(7)
  end
end