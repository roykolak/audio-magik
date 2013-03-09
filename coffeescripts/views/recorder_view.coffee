class App.Views.RecorderView extends Backbone.View
  el: '.recorder_view'

  template: """
    <div>
      <div class="controls">
        <button class="start">record</button>
        <button class="stop">stop</button>
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
    @resetControls()

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
      @resetControls()
      @$('.preview').fadeIn()

  onAgainClicked: (e) ->
    e.preventDefault()
    @$('.preview').fadeOut =>
      @$('.controls').fadeIn()

  updateAudioPreview: ->
    @audioRecorder.export (blob) ->
      url = URL.createObjectURL(blob)
      @$('audio').attr('src', url)

  resetControls: ->
    @$('.start').show()
    @$('.stop').hide()
