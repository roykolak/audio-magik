log = (message) ->
  $(".recorder_view").html("<h3 class='problem'>#{message}</h3>")

browser = new App.Models.Browser
  audioContext: !!App.Helpers.BrowserAdapter.AudioContext
  getUserMedia: !!App.Helpers.BrowserAdapter.getUserMedia

new App.Views.SupportView(model: browser).render()

if browser.valid()
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
else
  $('.recorder_view').hide()
