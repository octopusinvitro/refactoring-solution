# frozen_string_literal: true

require 'spec_helper'
require 'fixnum'

RSpec.describe Fixnum do
  it 'ordinalizes ones' do
    expect(1.ordinalize).to eq('1st')
    expect(51.ordinalize).to eq('51st')
    expect(1231.ordinalize).to eq('1231st')
  end

  it 'ordinalizes twos' do
    expect(2.ordinalize).to eq('2nd')
    expect(72.ordinalize).to eq('72nd')
    expect(432.ordinalize).to eq('432nd')
  end

  it 'ordinalizes threes' do
    expect(3.ordinalize).to eq('3rd')
    expect(23.ordinalize).to eq('23rd')
    expect(91_233.ordinalize).to eq('91233rd')
  end

  it 'ordinalizes exceptions 11, 12 and 13' do
    expect(11.ordinalize).to eq('11th')
    expect(12.ordinalize).to eq('12th')
    expect(13.ordinalize).to eq('13th')
  end

  it 'ordinalizes rest' do
    expect(0.ordinalize).to eq('0th')
    expect(4.ordinalize).to eq('4th')
    expect(15.ordinalize).to eq('15th')
    expect(236.ordinalize).to eq('236th')
    expect(3457.ordinalize).to eq('3457th')
    expect(48.ordinalize).to eq('48th')
    expect(999.ordinalize).to eq('999th')
  end
end
