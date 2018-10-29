# frozen_string_literal: true

class Ordinalizer
  GENERIC_ORDINAL = 'th'
  FIRST_THREE_ORDINALS = {
    '1' => 'st',
    '2' => 'nd',
    '3' => 'rd'
  }.freeze

  def self.run(number)
    new(number).run
  end

  def initialize(number)
    @number = number
  end

  def run
    "#{number}#{ordinal_indicator}"
  end

  private

  attr_reader :number

  def ordinal_indicator
    return GENERIC_ORDINAL if exception_to_first_three?

    FIRST_THREE_ORDINALS.fetch((abs % 10).to_s, GENERIC_ORDINAL)
  end

  def exception_to_first_three?
    (11..13).cover?(abs % 100)
  end

  def abs
    number.abs
  end
end
