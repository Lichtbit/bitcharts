#= require jquery
#= require chart.min.js


$ ->
  Chart.defaults.global.legend.display = false
  lineDefaults = Chart.defaults.global.elements.line
  lineDefaults.borderWidth = 2
  lineDefaults.tension = 0.0
  pointDefaults = Chart.defaults.global.elements.point
  pointDefaults.borderWidth = 2

  $('canvas[data-bitchart]').each ->
    canvas = $(this)
    id     = canvas.data('bitchart')
    colors = (canvas.data('bitchart-colors') || '#78AEEB').split(' ')
    data   =
      from:     canvas.data('bitchart-from')
      to:       canvas.data('bitchart-to')
      interval: canvas.data('bitchart-interval')
    $.get "/bitcharts/days/#{id}.json", data, (response) ->
      if Array.isArray(response.datasets)
        for color, index in colors
          break unless response.datasets[index]
          response.datasets[index].borderColor          = color
          response.datasets[index].pointBorderColor     = color
          response.datasets[index].backgroundColor      = hexToRgba(color, 0.25)
          response.datasets[index].pointBackgroundColor = '#FFFFFF'
        chart = new Chart(canvas, type: 'line', data: response)

hexToRgba = (hex, opacity) ->
    hex = hex.replace('#', '')
    r = parseInt(hex.substring(0, 2), 16)
    g = parseInt(hex.substring(2, 4), 16)
    b = parseInt(hex.substring(4, 6), 16)
    'rgba(' + r + ',' + g + ',' + b + ',' + opacity + ')'