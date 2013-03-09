class App.Views.SupportView extends Backbone.View
  el: '.support_view'

  template: """
    <ul class="support"></ul>
  """

  render: ->
    @$el.html(@template)

    if !@model.get('audioContext') && !@model.get('getUserMedia')
      @unsupported('AudioContext')
      @unsupported('getUserMedia')
    else if !@model.get('audioContext')
      @unsupported('AudioContext')
      @supported('getUserMedia')
    else if !@model.get('getUserMedia')
      @unsupported('getUserMedia')
      @supported('AudioContext')
    else
      @supported('AudioContext')
      @supported('getUserMedia')

  supported: (item) ->
    @$('.support').append("<li class='supported'><span class='fontawesome-ok icon'></span>#{item}</li>")

  unsupported: (item) ->
    @$('.support').append("<li class='unsupported'><span class='fontawesome-remove-sign icon'></span>#{item}</li>")
