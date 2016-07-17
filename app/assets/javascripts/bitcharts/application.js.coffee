#= require jquery
#= require chart.min.js


$ ->
  
  lineDefaults = Chart.defaults.global.elements.line
  lineDefaults.backgroundColor = 'rgba(67,156,202,.25)'
  lineDefaults.borderColor = 'rgba(67,156,202,1)'
  lineDefaults.borderWidth = 2
  lineDefaults.tension = 0.0

  pointDefaults = Chart.defaults.global.elements.point
  pointDefaults.backgroundColor = '#FFFFFF'
  pointDefaults.borderWidth = 2
  pointDefaults.borderColor = 'rgba(67,156,202,1)'

  Chart.defaults.global.legend.display = false

  $('canvas[data-bitchart]').each ->
    canvas = $(this)
    id = canvas.data('bitchart')
    data =
      from:     canvas.data('bitchart-from')
      to:       canvas.data('bitchart-to')
      interval: canvas.data('bitchart-interval')
    $.get "/bitcharts/days/#{id}.json", data, (response) ->
      if Array.isArray(response.datasets)
        chart = new Chart(canvas, type: 'line', data: response)
