#= require jquery
#= require chart.min.js

Bitcharts =

  defaultBorderWidth:  2
  defaultColorsString: '#78AEEB #55B662 #CB4FBA'
  defaultTension:      0.0

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

  styleDataset: (dataset, color) ->
    dataset.borderColor          = color
    dataset.pointBorderColor     = color
    dataset.backgroundColor      = Bitcharts.hexToRgba(color, 0.25)
    dataset.pointBackgroundColor = '#FFFFFF'


$ ->

  Bitcharts.setDefaultStyle()

  $('canvas[data-bitchart]').each ->
    canvas = $(this)
    id     = canvas.data('bitchart')
    colors = canvas.data('bitchart-colors') || Bitcharts.defaultColorsString
    colors = colors.split(' ')
    data   =
      from:     canvas.data('bitchart-from')
      to:       canvas.data('bitchart-to')
      interval: canvas.data('bitchart-interval')
    $.get "/bitcharts/days/#{id}.json", data, (response) ->
      if Array.isArray(response.datasets)
        for color, index in colors
          break unless response.datasets[index]
          Bitcharts.styleDataset(response.datasets[index], color)
        chart = new Chart(canvas, type: 'line', data: response)
