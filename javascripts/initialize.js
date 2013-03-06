// Generated by CoffeeScript 1.6.1
(function() {

  $(function() {
    var mediaController;
    mediaController = new App.Controller.MediaController();
    return mediaController.askForAudio({
      allow: function(stream) {
        var audioRecorder;
        audioRecorder = new App.Lib.AudioRecorder(stream);
        audioRecorder.create();
        return new App.Views.RecorderView({
          audioRecorder: audioRecorder
        }).render();
      },
      deny: function() {
        return $('.recorder_view').html('<h3 class="problem">You have denied audio access and that really hurts...</h3>');
      },
      error: function() {
        return $('.recorder_view').html('<h3 class="problem">Looks like your browser does not support this.</h3>');
      }
    });
  });

}).call(this);
