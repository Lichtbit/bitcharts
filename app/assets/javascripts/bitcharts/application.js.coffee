#= require jquery
#= require chart.min.js

Bitcharts =

  defaultBorderWidth:  2
  defaultColorsString: '#78AEEB #55B662 #CB4FBA'
  defaultCornerRadius: 0
  defaultTension:      0.0
  defaultType:         'line'

  hexToRgba: (hex, opacity) ->
    hex = hex.replace('#', '')
    r = parseInt(hex.substring(0, 2), 16)
    g = parseInt(hex.substring(2, 4), 16)
    b = parseInt(hex.substring(4, 6), 16)
    'rgba(' + r + ',' + g + ',' + b + ',' + opacity + ')'

  setDefaultStyle: ->
    Chart.defaults.global.legend.display = false
    lineDefaults = Chart.defaults.global.elements.line
    lineDefaults.borderWidth = Bitcharts.defaultBorderWidth
    lineDefaults.tension = Bitcharts.defaultTension
    pointDefaults = Chart.defaults.global.elements.point
    pointDefaults.borderWidth = Bitcharts.defaultBorderWidth
    rectangleDefaults = Chart.defaults.global.elements.rectangle
    rectangleDefaults.borderWidth = Bitcharts.defaultBorderWidth
    tooltipDefaults = Chart.defaults.global.tooltips
    tooltipDefaults.cornerRadius = Bitcharts.defaultCornerRadius

  styleDataset: (dataset, color) ->
    dataset.borderColor          = color
    dataset.pointBorderColor     = color
    dataset.backgroundColor      = Bitcharts.hexToRgba(color, 0.25)
    dataset.pointBackgroundColor = '#FFFFFF'


$ ->

  Bitcharts.setDefaultStyle()

  $('canvas[data-bitchart]').each ->
    canvas = $(this)
    keys   = canvas.data('bitchart')
    colors = canvas.data('bitchart-colors') || Bitcharts.defaultColorsString
    colors = colors.split(' ')
    type   = canvas.data('bitchart-type') || Bitcharts.defaultType
    data   =
      from:     canvas.data('bitchart-from')
      to:       canvas.data('bitchart-to')
      interval: canvas.data('bitchart-interval')
    $.get "/bitcharts/days/#{encodeURIComponent(keys)}.json", data, (response) ->
      if Array.isArray(response.datasets)
        for color, index in colors
          break unless response.datasets[index]
          Bitcharts.styleDataset(response.datasets[index], color)
        chart = new Chart(canvas, type: type, data: response)
