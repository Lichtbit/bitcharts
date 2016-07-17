#= require jquery
#= require chart.min.js

$ ->

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
