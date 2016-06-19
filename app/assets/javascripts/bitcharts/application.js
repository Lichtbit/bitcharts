//= require jquery
//= require chart.min.js

$(function() {
  var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
      {
        label: 'Important numbers',
        data: [65, 59, 80, 81, 56, 55, 40],
      }
    ]
  };
  var ctx = $('.bitchart');
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: data,
  });
});