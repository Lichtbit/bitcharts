for date in [Date.parse('2015-12-31'), Date.today]
  for i in 0..40
    date = date + 1.day
    value = i%9
    Bitcharts::Day.create!(date: date, key: 'example_1', value: value)
    Bitcharts::Day.create!(date: date, key: 'example_2', value: (value*1.3 - 2))
  end
end