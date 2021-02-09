require './spec/spec_helper'
require './lib/interval'

RSpec.describe "Intervalクラス" do
  it 'show_dotメソッドを呼び出すとドットが3回表示される' do
    expect do
      Interval.show_dot
    end.to output("・\n・\n・\n").to_stdout
  end
end