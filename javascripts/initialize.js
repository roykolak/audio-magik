// Generated by CoffeeScript 1.6.1
(function() {
  var browser, log, mediaController;

  log = function(message) {
    return $(".recorder_view").html("<h3 class='problem'>" + message + "</h3>");
  };

  browser = new App.Models.Browser({
    audioContext: !!App.Helpers.BrowserAdapter.AudioContext,
    getUserMedia: !!App.Helpers.BrowserAdapter.getUserMedia
  });

  new App.Views.SupportView({
    model: browser
  }).render();

  if (browser.valid()) {
    $('body').addClass('asking');
    mediaController = new App.Controller.MediaController();
    mediaController.askForAudio({
      allow: function(stream) {
        var audioRecorder;
        $('body').removeClass('asking');
        audioRecorder = new App.Lib.AudioRecorder(stream);
        audioRecorder.create();
        return new App.Views.RecorderView({
          audioRecorder: audioRecorder
        }).render();
      },
      deny: function() {
        $('body').removeClass('asking');
        return log('You have denied audio access and that really hurts...');
      }
    });
  } else {
    $('.recorder_view').hide();
  }

}).call(this);
