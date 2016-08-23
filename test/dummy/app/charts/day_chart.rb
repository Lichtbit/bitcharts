class DayChart < Bitcharts::BaseChart
  has_key :example_1

  def value(date_range)
    Bitcharts::Day.where(key: :example_1, date: date_range).sum(:value)
  end
end