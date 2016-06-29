require 'test_helper'

class DayCreationChartTest < ActiveSupport::TestCase
  test "registers as chart" do
    DayCreationChart
    assert_equal Bitcharts::BaseChart.for_key(:example_2).class, DayCreationChart
  end
end
