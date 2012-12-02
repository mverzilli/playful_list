window.game_finished_success = () =>
  window.stats['completed_at'] = new Date()

  $('#stats').val(JSON.stringify(window.stats))
  $('form#completeIteration').submit()

window.stats = {
  hints: 0
  attempts: 1
}

$ ->
  window.stats['started_at'] = new Date()

