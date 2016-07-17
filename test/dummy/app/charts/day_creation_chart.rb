class DayCreationChart < Bitcharts::BaseChart
  has_key :example_2

  def label
    'Beispiel 2'
  end

  def value_for_time_range(time_range)
    Bitcharts::Day.where(created_at: time_range).sum(:value)
  end
end