window.on_load = (question) ->
  $('.wrong').click ->
    $('.right').addClass 'glow_effect'

  $('.right').click ->
    alert 'Bien!'

