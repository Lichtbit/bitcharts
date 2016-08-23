class DayChart < Bitcharts::BaseChart
  has_key :example_1
  has_scope

  def value(date_range)
    base_relation(date_range).sum(:value)
  end

  def scoped_value(date_range, scope)
    base_relation(date_range).sum(:value) + scope.to_i
  end

  protected

  def base_relation(date_range)
    Bitcharts::Day.where(key: :example_1, date: date_range)
  end
end