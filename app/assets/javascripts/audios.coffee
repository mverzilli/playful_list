window.playSound = (sound, callback) =>
  $("audio##{sound}").on('ended', callback) if callback?
  $("audio##{sound}").get(0).play()