class App.Controller.MediaController
  askForAudio: (callbacks) ->
    getUserMedia = App.Helpers.BrowserAdapter.getUserMedia
    getUserMedia.call navigator, {audio: true}, (stream) =>
      callbacks.allow(stream)
    , (e) ->
      callbacks.deny(e)
