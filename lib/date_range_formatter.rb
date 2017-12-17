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
    if same_day?
      same_day
    elsif same_month?
      same_month
    elsif same_year?
      same_year
    else
      different_year
    end
  end

  private

  attr_reader :start_date, :end_date, :start_time, :end_time

  def same_day?
    start_date == end_date
  end

  def same_month?
    start_date.month == end_date.month
  end

  def same_year?
    start_date.year == end_date.year
  end

  def same_day
    if start_time && end_time
      "#{full_start_date} at #{start_time} to #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time}"
    elsif end_time
      "#{full_start_date} until #{end_time}"
    else
      full_start_date
    end
  end

  def same_month
    if start_time && end_time
      "#{full_start_date} at #{start_time} - " \
        "#{full_end_date} at #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif end_time
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      start_date.strftime("#{start_date.day.ordinalize} - " \
        "#{end_date.day.ordinalize} %B %Y")
    end
  end

  def same_year
    if start_time && end_time
      "#{full_start_date} at #{start_time} - " \
        "#{full_end_date} at #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif end_time
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      start_date.strftime("#{start_date.day.ordinalize} %B - ") +
        end_date.strftime("#{end_date.day.ordinalize} %B %Y")
    end
  end

  def different_year
    if start_time && end_time
      "#{full_start_date} at #{start_time} - " \
        "#{full_end_date} at #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif end_time
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      "#{full_start_date} - #{full_end_date}"
    end
  end

  def full_start_date
    full_date(start_date)
  end

  def full_end_date
    full_date(end_date)
  end

  def full_date(date)
    date.strftime(format_date(date))
  end

  def format_date(date)
    "#{date.day.ordinalize} %B %Y"
  end
end
