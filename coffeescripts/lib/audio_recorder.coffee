class App.Lib.AudioRecorder
  constructor: (@stream) ->

  create: ->
    @audioContext = new App.Helpers.BrowserAdapter.AudioContext
    input = @audioContext.createMediaStreamSource(@stream)
    input.connect(@audioContext.destination)
    @recorder = new App.Helpers.BrowserAdapter.Recorder(input)

  start: ->
    @recorder.record()

  stop: ->
    @recorder.stop()

  clear: ->
    @recorder.clear()

  export: (callback) ->
    @recorder.exportWAV (blob) ->
      callback(blob)
