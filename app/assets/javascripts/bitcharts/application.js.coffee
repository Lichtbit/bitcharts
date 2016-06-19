#= require jquery
#= require chart.min.js

$ ->
  data = 
    labels: [
      'January'
      'February'
      'March'
      'April'
      'May'
      'June'
      'July'
    ]
    datasets: [ {
      label: 'Important numbers'
      data: [
        65
        59
        80
        81
        56
        55
        40
      ]
    } ]
  ctx = $('.bitchart')
  myLineChart = new Chart(ctx,
    type: 'line'
    data: data)