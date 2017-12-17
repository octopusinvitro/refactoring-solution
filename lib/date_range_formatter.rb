# frozen_string_literal: true

require 'date'
require 'fixnum'

class DateRangeFormatter
  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    if same_date?
      same_date
    else
      different_date
    end
  end

  private

  attr_reader :start_date, :end_date, :start_time, :end_time

  def same_date?
    start_date == end_date
  end

  def same_month?
    start_date.month == end_date.month
  end

  def same_year?
    start_date.year == end_date.year
  end

  def same_date
    if start_time && end_time
      "#{full_start_date}#{full_start_time} to #{end_time}"
    elsif end_time
      "#{full_start_date}#{full_start_time} until #{end_time}"
    else
      "#{full_start_date}#{full_start_time}"
    end
  end

  def different_date
    "#{full_start_date}#{full_start_time} - #{full_end_date}#{full_end_time}"
  end

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize}#{month_and_year}")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end

  def full_start_time
    " at #{start_time}" if start_time
  end

  def full_end_time
    " at #{end_time}" if end_time
  end

  def month_and_year
    if start_time || end_time
      ' %B %Y'
    else
      if same_date?
        ' %B %Y'
      elsif same_year? && same_month?
        ''
      elsif same_year?
        ' %B'
      else
        ' %B %Y'
      end
    end
  end
end
