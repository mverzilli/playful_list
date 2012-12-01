window.on_load = (question) ->
  $('.wrong').click ->
    alert 'Mal!'

  $('.right').click ->
    alert 'Bien!'

