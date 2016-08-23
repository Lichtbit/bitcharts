class <%= class_name %>Chart < Bitcharts::BaseChart
  has_key :<%= table_name %>
  has_scope

  def label
    '<%= human_name %>'
  end

  def scoped_label(scope)
    "#{label} (#{scope})"
  end

  def value(date_range)
    base(date_range).count
  end

  def scoped_value(date_range, scope)
    base(date_range).where(association_id: scope.to_id).count
  end

  protected

  def base(date_range)
    <%= class_name.singularize %>.where(created_at: date_range)
  end
end