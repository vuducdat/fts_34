@add_fields = (link, assoc, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + assoc, "g")
  $(link).before(content.replace(regexp, new_id))

@remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val("1")
  $(link).closest(".field").hide()

$(document).ready ->
  counter = 2400
  countdown = ->
    counter--
    hour = Math.floor(counter/3600)
    minute = Math.floor((counter % 3600)/60)
    second = (counter % 3600) % 60
    if counter >= 0
      $("#hour").html(hour)
      $("#minute").html(minute)
      $("#second").html(second)
    else
      clearInterval()
      $(".submit-exam").click()
  setInterval(countdown, 1000)
