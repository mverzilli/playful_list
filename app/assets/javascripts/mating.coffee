class window.MatingGame
  constructor: ->
    $('.wrong').click =>
      @error()

    $('.right').click =>
      @success()

    @attempts = 0
    @timeout = null
    @start_clock()

  start_clock: =>
    if @timeout != null
      clearTimeout(@timeout)
    @timeout = null

    @timeout = window.setTimeout(() =>
      @error()
    , 10000)

  success: =>
    window.playSound 'iteration-complete', () =>
      if @attempts == 1
        @attempts++
        @restart()
      else
        game_finished_success()

  error: =>
    @attempts++
    @hint()

  hint: =>
    $('.right').addClass 'glow_effect'
    window.playSound 'call-to-action'

  restart: =>
    $('.right').removeClass 'glow_effect'
    @start_clock()


window.on_load = (question) ->
  window.mating_game = new MatingGame()





