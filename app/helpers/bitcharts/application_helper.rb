module Bitcharts
  module ApplicationHelper
    def bitchart(keys, from: 7.days.ago, to: 0.days.ago, interval: '1 day', type: 'line', colors: nil, **options)
      keys     = keys.join(' ')   if keys.respond_to?(:join)
      from     = from.to_date     if from.respond_to?(:to_date)
      to       = to.to_date       if to.respond_to?(:to_date)
      interval = interval.inspect if interval.is_a?(ActiveSupport::Duration)
      colors   = colors.join(' ') if keys.respond_to?(:join)
      data     = {
        bitchart:          keys,
        bitchart_type:     type,
        bitchart_from:     from.try(:to_s),
        bitchart_to:       to.try(:to_s),
        bitchart_interval: interval,
        bitchart_colors:   colors,
      }
      tag(:canvas, options.merge(data: data.compact))
    end
  end
end
