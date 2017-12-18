# frozen_string_literal: true

require 'spec_helper'
require 'ordinalizer'

RSpec.describe Ordinalizer do
  it 'ordinalizes ones' do
    expect(described_class.run(1)).to eq('1st')
    expect(described_class.run(51)).to eq('51st')
    expect(described_class.run(1231)).to eq('1231st')
  end

  it 'ordinalizes twos' do
    expect(described_class.run(2)).to eq('2nd')
    expect(described_class.run(72)).to eq('72nd')
    expect(described_class.run(432)).to eq('432nd')
  end

  it 'ordinalizes threes' do
    expect(described_class.run(3)).to eq('3rd')
    expect(described_class.run(23)).to eq('23rd')
    expect(described_class.run(91_233)).to eq('91233rd')
  end

  it 'ordinalizes exceptions 11, 12 and 13' do
    expect(described_class.run(11)).to eq('11th')
    expect(described_class.run(12)).to eq('12th')
    expect(described_class.run(13)).to eq('13th')
  end

  it 'ordinalizes rest' do
    expect(described_class.run(0)).to eq('0th')
    expect(described_class.run(4)).to eq('4th')
    expect(described_class.run(15)).to eq('15th')
    expect(described_class.run(236)).to eq('236th')
    expect(described_class.run(3457)).to eq('3457th')
    expect(described_class.run(48)).to eq('48th')
    expect(described_class.run(999)).to eq('999th')
  end
end
