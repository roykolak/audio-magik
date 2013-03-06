class App.Views.RecorderView extends Backbone.View
  el: '.recorder_view'

  template: """
    <div>
      <div class="controls">
        <button class="start">record</button>
        <button class="stop" style="display: none">stop</button>
      </div>
      <div class="preview" style="display: none">
        <div class="player">
          <audio controls="true" src=""/>
        </div>
        <a href="#" class="again">Record again</a>
      </div>
    </div>
  """

  initialize: (options) ->
    @audioRecorder = options.audioRecorder

  events:
    'click .start': 'onStartClicked'
    'click .stop': 'onStopClicked'
    'click .again': 'onAgainClicked'

  render: ->
    @$el.html(@template)

  onStartClicked: (ev) ->
    ev.preventDefault()
    @audioRecorder.start()
    @$('.start').hide()
    @$('.stop').show()
    @$('.preview').fadeOut()

  onStopClicked: (ev) ->
    ev.preventDefault()
    @audioRecorder.stop()
    @updateAudioPreview()
    @audioRecorder.clear()
    @$('.controls').fadeOut =>
      @$('.preview').fadeIn()

  onAgainClicked: (e) ->
    e.preventDefault()
    @$('.preview').fadeOut =>
      @$('.controls').fadeIn()

  updateAudioPreview: ->
    @audioRecorder.export (blob) ->
      url = URL.createObjectURL(blob)
      @$('audio').attr('src', url)
