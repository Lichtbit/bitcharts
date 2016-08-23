class <%= class_name %>Chart < Bitcharts::BaseChart
  has_key :<%= table_name %>

  def label
    '<%= human_name %>'
  end

  def value(date_range)
    <%= class_name.singularize %>.where(created_at: date_range).count
  end
end