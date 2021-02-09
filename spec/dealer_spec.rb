require './spec/spec_helper'
require './lib/dealer'

RSpec.describe "Dealerクラス" do
  it 'Dealerインスタンスを生成できる'  do
    dealer = Player.new
    expect(dealer).not_to be_nil
  end
end