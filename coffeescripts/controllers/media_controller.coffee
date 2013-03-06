class App.Controller.MediaController
  askForAudio: (callbacks) ->
    if App.Helpers.BrowserAdapter.AudioContext && App.Helpers.BrowserAdapter.getUserMedia
      getUserMedia = App.Helpers.BrowserAdapter.getUserMedia
      getUserMedia.call navigator, {audio: true}, (stream) =>
        callbacks.allow(stream)
      , (e) ->
        callbacks.deny(e)
    else
      callbacks.error()
