# frozen_string_literal: true

DateRange = Struct.new(:start_date, :end_date) do
  def same_dates?
    start_date == end_date
  end

  def same_month?
    start_date.month == end_date.month
  end

  def same_year?
    start_date.year == end_date.year
  end

  def same_year_and_month?
    same_year? && same_month?
  end

  def start_day
    start_date.day
  end

  def end_day
    end_date.day
  end
end
