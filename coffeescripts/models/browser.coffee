class App.Models.Browser extends Backbone.Model

  valid: ->
    @get('audioContext') && @get('getUserMedia')
