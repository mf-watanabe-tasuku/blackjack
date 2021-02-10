require './spec/spec_helper'
require './lib/player'
require './lib/deck'

RSpec.describe "Playerクラス" do
  let(:player) { Player.new }
  let(:deck) { Deck.new }
  let(:player_cards) { player.deal_card(deck) }

  context 'initialize' do
    it 'Playerインスタンスが生成される'  do
      expect(player).not_to be_nil
    end
  end

  context 'deal_card' do
    it '手札が2枚になる' do
      expect(player_cards.length).to eq(2)
    end
  end

  context 'select_draw_card?' do
    context '標準入力' do
      it 'yを入力するとtrueが返る' do
        allow(player).to receive(:gets) { 'y' }
        expect(player.select_draw_card?).to be true
      end

      it 'nを入力するとfalseが返る' do
        allow(player).to receive(:gets) { 'n' }
        expect(player.select_draw_card?).to be false
      end

      # it 'yとn以外を入力すると怒られる' do
      #   allow(player).to receive(:gets) { 't' }
      #   expect(player.select_draw_card?).to output("入力内容が正しくありません。もう一度入力してください。\n").to_stdout
      # end
    end
  end
end