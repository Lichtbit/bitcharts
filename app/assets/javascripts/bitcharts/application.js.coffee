#= require jquery
#= require chart.min.js

$ ->

  $('canvas[data-bitchart]').each ->
    canvas = $(this)
    id = canvas.data('bitchart')
    $.get "/bitcharts/days/#{id}.json", (response) ->
      if Array.isArray(response.datasets)
        chart = new Chart(canvas, type: 'line', data: response)
