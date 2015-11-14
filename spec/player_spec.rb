require_relative '../lib/player'
require_relative '../lib/card'

RSpec.describe Player do
  describe '#value' do
    before do
      subject.reset!
    end

    context 'has two numbers' do
      before do
        subject.hit!(Card.new(:clubs, 4))
        subject.hit!(Card.new(:diamonds, 10))
      end

      its(:value) { is_expected.to eq(14) }
    end

    context 'has one ace and one number' do
      before do
        subject.hit!(Card.new(:clubs, 'A'))
        subject.hit!(Card.new(:diamonds, 10))
      end

      its(:value) { is_expected.to eq(21) }
    end

    context 'has two aces' do
      before do
        subject.hit!(Card.new(:clubs, 'A'))
        subject.hit!(Card.new(:diamonds, 'A'))
      end

      its(:value) { is_expected.to eq(12) }
    end

    context 'has two facecards' do
      before do
        subject.hit!(Card.new(:clubs, 'J'))
        subject.hit!(Card.new(:diamonds, 'Q'))
      end

      its(:value) { is_expected.to eq(20) }
    end
  end

  describe '#hit!' do
    let(:card) { Card.new(:clubs, 4) }

    it 'increments player cards by 1' do
      expect { subject.hit!(card) }.to change { subject.cards.count }.by(1)
    end
  end

  describe '#reset!' do
    before do
      subject.hit!(Card.new(:clubs, 4))
      subject.hit!(Card.new(:diamonds, 10))
    end

    it "empty player's cards" do
      expect { subject.reset! }.to change { subject.cards }.by([])
    end
  end

  describe '#compare' do
    before do
      subject.reset!
      subject.hit!(Card.new(:clubs, 4))
      subject.hit!(Card.new(:diamonds, 10))
    end

    context 'player 1 won' do
      player2 = described_class.new('')
      player2.hit!(Card.new(:clubs, 5))
      player2.hit!(Card.new(:diamonds, 'Q'))

      it 'loses' do
        expect(subject.compare(player2.value)).to eq('LOSE')
      end
    end

    context 'player 1 lost' do
      player2 = described_class.new('')
      player2.hit!(Card.new(:clubs, 1))
      player2.hit!(Card.new(:diamonds, 'A'))

      it 'wins' do
        expect(subject.compare(player2.value)).to eq('WIN')
      end
    end

    context 'players are tied' do
      player2 = described_class.new('')
      player2.hit!(Card.new(:clubs, 3))
      player2.hit!(Card.new(:diamonds, 'A'))

      it 'is a tie' do
        expect(subject.compare(player2.value)).to eq('TIE')
      end
    end
  end
end
