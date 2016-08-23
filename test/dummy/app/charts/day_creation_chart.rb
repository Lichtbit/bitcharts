class DayCreationChart < Bitcharts::BaseChart
  has_key :example_2

  def label
    'Beispiel 2'
  end

  def value(date_range)
    Bitcharts::Day.where(created_at: date_range).sum(:value)
  end
end