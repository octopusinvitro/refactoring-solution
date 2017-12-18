# frozen_string_literal: true

require 'date'
require 'fixnum'

class DateRangeFormatter
  MONTH = '%B'
  YEAR = '%Y'

  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    "#{full_start_date}#{formatted_start_time}" \
    "#{full_end_date_with_dash}#{formatted_end_time}"
  end

  private

  attr_reader :start_date, :end_date, :start_time, :end_time

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize}#{start_month_year}")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize}#{end_month_year}")
  end

  def full_end_date_with_dash
    " - #{full_end_date}" unless same_dates?
  end

  def formatted_start_time
    " at #{start_time}" if start_time
  end

  def formatted_end_time
    "#{preposition}#{end_time}" if end_time
  end

  def preposition
    return ' at ' unless same_dates?
    return ' to ' if start_time
    ' until '
  end

  def same_dates?
    start_date == end_date
  end

  def same_month?
    start_date.month == end_date.month
  end

  def same_year?
    start_date.year == end_date.year
  end

  def a_time_was_provided?
    start_time || end_time
  end

  def start_month_year
    return " #{MONTH} #{YEAR}" if a_time_was_provided? || same_dates?
    return '' if same_year? && same_month?
    return " #{MONTH}" if same_year?
    " #{MONTH} #{YEAR}"
  end

  def end_month_year
    " #{MONTH} #{YEAR}"
  end
end
