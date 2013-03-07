log = (message) ->
  $(".recorder_view").html("<h3 class='problem'>#{message}</h3>")

if !App.Helpers.BrowserAdapter.AudioContext && !App.Helpers.BrowserAdapter.getUserMedia
  log('Your browser does not support getUserMedia or AudioContext')
else if !App.Helpers.BrowserAdapter.AudioContext
  log('Your browser does not support AudioContext')
else if !App.Helpers.BrowserAdapter.getUserMedia
  log('Your browser does not support getUserMedia')
else
  $('body').addClass('asking')
  mediaController = new App.Controller.MediaController()
  mediaController.askForAudio
    allow: (stream) ->
      $('body').removeClass('asking')
      audioRecorder = new App.Lib.AudioRecorder(stream)
      audioRecorder.create()
      new App.Views.RecorderView(audioRecorder: audioRecorder).render()
    deny: ->
      $('body').removeClass('asking')
      log('You have denied audio access and that really hurts...')
