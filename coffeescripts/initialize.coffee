$( ->
  mediaController = new App.Controller.MediaController()
  mediaController.askForAudio
    allow: (stream) ->
      audioRecorder = new App.Lib.AudioRecorder(stream)
      audioRecorder.create()
      new App.Views.RecorderView(audioRecorder: audioRecorder).render()
    deny: ->
      $('.recorder_view').html('<h3 class="problem">You have denied audio access and that really hurts...</h3>')
    error: ->
      $('.recorder_view').html('<h3 class="problem">Looks like your browser does not support this.</h3>')
)
