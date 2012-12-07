window.game_finished_too_many_attempts = () =>
  window.stats['completed_at'] = new Date()
  window.stats['too_many_attempts'] = true

  $('#stats_too_many').val(JSON.stringify(window.stats))
  $('form#tooManyAttempts').submit()


window.game_finished_success = () =>
  window.stats['completed_at'] = new Date()

  $('#stats').val(JSON.stringify(window.stats))
  $('form#completeIteration').submit()

window.stats = {
  hints: 0
  attempts: 1
  errors: 0
  too_many_attempts: false
}

$ ->
  window.stats['started_at'] = new Date()

