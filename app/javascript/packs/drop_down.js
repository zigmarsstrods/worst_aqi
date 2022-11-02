$(document).on("change","#country",function() {
	// console.log($('option:selected',this).val())
	country_id = $('option:selected',this).val()

  $.ajax({url: "/stations/"+country_id+"/country_aqi", success: function(result){
	//debugger
    $("#aqi_result").text(result.aqi);
  }});
})