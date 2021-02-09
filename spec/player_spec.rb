require './spec/spec_helper'
require './lib/player'

RSpec.describe "Playerクラス" do
  it 'Playerインスタンスを生成できる'  do
    player = Player.new
    expect(player).not_to be_nil
  end
end