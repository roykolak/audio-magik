// Generated by CoffeeScript 1.6.1
(function() {

  App.Helpers.BrowserAdapter = {
    AudioContext: window.AudioContext || window.webkitAudioContext,
    URL: window.URL || window.webkitURL,
    Recorder: window.Recorder,
    getUserMedia: navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia
  };

}).call(this);
