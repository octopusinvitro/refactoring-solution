# frozen_string_literal: true

require 'date'
require 'date_range'
require 'ordinalizer'

class DateRangeFormatter
  MONTH = '%B'
  YEAR = '%Y'

  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @range = DateRange.new(Date.parse(start_date), Date.parse(end_date))
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    "#{full_start_date}#{formatted_start_time}" \
    "#{full_end_date_with_dash}#{formatted_end_time}"
  end

  private

  attr_reader :range, :start_time, :end_time

  def full_start_date
    range.start_date.strftime("#{ordinalized_start_day}#{start_month_year}")
  end

  def full_end_date
    range.end_date.strftime("#{ordinalized_end_day}#{end_month_year}")
  end

  def full_end_date_with_dash
    " - #{full_end_date}" unless range.same_dates?
  end

  def formatted_start_time
    " at #{start_time}" if start_time
  end

  def formatted_end_time
    "#{preposition}#{end_time}" if end_time
  end

  def preposition
    return ' at ' unless range.same_dates?
    return ' to ' if start_time

    ' until '
  end

  def a_time_was_provided?
    start_time || end_time
  end

  def start_month_year
    return " #{MONTH} #{YEAR}" if a_time_was_provided? || range.same_dates?
    return '' if range.same_year_and_month?
    return " #{MONTH}" if range.same_year?

    " #{MONTH} #{YEAR}"
  end

  def end_month_year
    " #{MONTH} #{YEAR}"
  end

  def ordinalized_start_day
    Ordinalizer.run(range.start_day)
  end

  def ordinalized_end_day
    Ordinalizer.run(range.end_day)
  end
end
