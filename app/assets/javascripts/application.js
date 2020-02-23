// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require chart
//= require highcharts
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require_tree .

// Set time to alert disappear
$(function() {
  setTimeout(function(){
    $('.alert').fadeOut(500);
  }, 2000);
});

$(document).ready(function() {
  var ctx = document.getElementById('myChart').getContext('2d');

  var data = {
    labels: ["Comunicação", "Trabalho em Equipe", "Relacionamento",
    "Organização", "Adaptação", "Trabalho sob pressão", "Proatividade",
    "Iniciativa", "Dinamismo"],
    datasets: [{
      label: "Estudante A",
      backgroundColor: "rgba(0,0,200,0.2)",
      data: [1, 3, 2, 2, 2, 2, 1, 3, 2]
    }]
  };

  options = {
    scale: {
        angleLines: {
            display: false
        },
        ticks: {
            suggestedMin: 0,
            suggestedMax: 3
        }
    }
  };


  var myRadarChart = new Chart(ctx, {
    type: 'radar',
    data: data,
    options: options
  });
});
