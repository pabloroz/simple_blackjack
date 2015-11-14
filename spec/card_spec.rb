require_relative '../lib/card'

RSpec.describe Card do
  it 'accepts suit and rank' do
    card = described_class.new(:clubs, 10)
    expect(card.suit).to eq(:clubs)
    expect(card.value).to eq(10)
  end

  it 'facecards have value 10' do
    facecards = %w(J Q K)
    facecards.each do |facecard|
      card = described_class.new(:hearts, facecard)
      expect(card.value).to eq(10)
    end
  end
  it '7-diamonds have value 7' do
    card = described_class.new(:diamonds, 7)
    expect(card.value).to eq(7)
  end

  it 'Ace have value 1' do
    card = described_class.new(:clubs, 'A')
    expect(card.value).to eq(11)
  end

  it 'is formatted' do
    card = described_class.new(:diamonds, 'A')
    expect(card.to_s).to eq('A-D')
  end
end
