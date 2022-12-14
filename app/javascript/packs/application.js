// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import Chart from 'chart.js/auto';
import "bootstrap"
import 'jquery-ui/dist/jquery-ui'
import 'bootstrap-table'
import * as ActiveStorage from "@rails/activestorage"
import "channels"



//Rails.start()
Turbolinks.start()
ActiveStorage.start()

$( document ).ready(function() {
$('#country').on('change',function () {
   console.log($('#country').value);
   });
})

document.addEventListener('turbolinks:load', () => {
   var ctx = document.getElementById('myChart').getContext('2d');
   var myChart = new Chart(ctx, {
   type: 'bar',
   defaults: {
    backgroundColor:'rgba(0, 0, 0, 0.1)'
   },
   options: { 
    plugins: {
      legend: {
        display: false
      }
    }
   },
   data: {
     labels: JSON.parse(ctx.canvas.dataset.labels),
     datasets: [{
       data: JSON.parse(ctx.canvas.dataset.data),
     }]
   },
   });
 })
