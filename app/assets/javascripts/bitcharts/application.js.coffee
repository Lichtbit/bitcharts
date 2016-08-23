#= require jquery
#= require chart.min.js

@Bitcharts = Bitcharts =

  defaultBorderWidth:  2
  defaultColorsString: '#78AEEB #CF75C3 #55B662 #FFAE65'
  defaultCornerRadius: 0
  defaultTension:      0.0
  defaultType:         'line'
  defaultLinearScale:  ticks: { suggestedMin: 0 }

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
    Chart.scaleService.updateScaleDefaults('linear', Bitcharts.defaultLinearScale)

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
