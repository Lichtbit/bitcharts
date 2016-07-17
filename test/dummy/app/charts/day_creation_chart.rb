class DayCreationChart < Bitcharts::BaseChart
  has_key :example_2

  def value_for_time_range(time_range)
    Bitcharts::Day.where(created_at: time_range).sum(:value)
    2
  end
end