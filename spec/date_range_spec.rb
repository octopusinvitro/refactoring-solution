# frozen_string_literal: true

require 'spec_helper'
require 'date'
require 'date_range'

RSpec.describe DateRange do
  it 'detects same dates' do
    range = DateRange.new(Date.parse('2009-11-01'), Date.parse('2009-11-01'))
    expect(range.same_dates?).to be_truthy
  end

  it 'detects same month' do
    range = DateRange.new(Date.parse('2010-11-25'), Date.parse('2009-11-01'))
    expect(range.same_month?).to be_truthy
  end

  it 'detects same year' do
    range = DateRange.new(Date.parse('2009-12-01'), Date.parse('2009-10-01'))
    expect(range.same_year?).to be_truthy
  end

  it 'detects same year and month' do
    range = DateRange.new(Date.parse('2009-12-01'), Date.parse('2009-12-01'))
    expect(range.same_year_and_month?).to be_truthy
  end

  it 'knows the start day' do
    range = DateRange.new(Date.parse('2009-12-01'), Date.parse('2009-12-02'))
    expect(range.start_day).to eq(1)
  end

  it 'knows the end day' do
    range = DateRange.new(Date.parse('2009-12-01'), Date.parse('2009-12-02'))
    expect(range.end_day).to eq(2)
  end
end
