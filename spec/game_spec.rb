require './spec/spec_helper'
require './lib/game'

RSpec.describe "Gameクラス" do
  it 'Gameインスタンスを生成すると、メッセージが出力される' do
    expect do
      game = Game.new
    end.to output("=== カードを配ります ===\n").to_stdout
  end
end