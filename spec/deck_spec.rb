require_relative '../lib/deck'
require_relative '../lib/player'

RSpec.describe Deck do
  let(:cards) { subject.cards }
  let!(:first) { cards.first }
  let!(:second) { cards[1] }
  let!(:rest) { cards[2..cards.length] }
  let!(:last) { cards.last }

  describe '#new' do
    it { is_expected.to have_exactly(52).cards }

    it 'does not have duplicated cards' do
      expect(cards.map(&:to_s).uniq.length).to eq(52)
    end
  end

  describe '#shift!' do
    let(:player) { Player.new('') }

    before do
      2.times { player.hit!(subject.shift) }
    end

    it 'takes cards from the top' do
      expect(player.cards).to eq([first, second])
    end

    it 'removes cards from the top' do
      expect(cards).to eq(rest)
    end
  end

  describe '#shuffle!' do
    context 'shuffled deck' do
      before do
        subject.shuffle!
      end

      it 'shuffles the first card' do
        expect(cards.first).not_to eq(first)
      end

      it 'shuffles the second card' do
        expect(cards[1]).not_to eq(second)
      end

      it 'shuffles the last card' do
        expect(cards.last).not_to eq(last)
      end
    end

    context 'unshuffled deck' do
      it 'does not shuffle the first card' do
        expect(cards.first).to eq(first)
      end

      it 'does not shuffle the second card' do
        expect(cards[1]).to eq(second)
      end

      it 'does not shuffle the last card' do
        expect(cards.last).to eq(last)
      end
    end
  end
end
