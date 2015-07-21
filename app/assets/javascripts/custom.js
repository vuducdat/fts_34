$(document).ready(function(){
  var counter = 2400
  setInterval(function(){
    counter--;
    var hour = Math.floor(counter/3600);
    var minute = Math.floor((counter % 3600)/60);
    var second = (counter % 3600) % 60;
    if (counter >= 0){
      $("#hour").html(hour);
      $("#minute").html(minute);
      $("#second").html(second);
    }
    else {
      clearInterval();
      $(".submit-exam").click();
    }
  }, 1000);
});
