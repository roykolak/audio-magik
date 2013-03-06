// Generated by CoffeeScript 1.6.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  App.Views.RecorderView = (function(_super) {

    __extends(RecorderView, _super);

    function RecorderView() {
      return RecorderView.__super__.constructor.apply(this, arguments);
    }

    RecorderView.prototype.el = '.recorder_view';

    RecorderView.prototype.template = "<div>\n  <div class=\"controls\">\n    <button class=\"start\">record</button>\n    <button class=\"stop\" style=\"display: none\">stop</button>\n  </div>\n  <div class=\"preview\" style=\"display: none\">\n    <div class=\"player\">\n      <audio controls=\"true\" src=\"\"/>\n    </div>\n    <a href=\"#\" class=\"again\">Record again</a>\n  </div>\n</div>";

    RecorderView.prototype.initialize = function(options) {
      return this.audioRecorder = options.audioRecorder;
    };

    RecorderView.prototype.events = {
      'click .start': 'onStartClicked',
      'click .stop': 'onStopClicked',
      'click .again': 'onAgainClicked'
    };

    RecorderView.prototype.render = function() {
      return this.$el.html(this.template);
    };

    RecorderView.prototype.onStartClicked = function(ev) {
      ev.preventDefault();
      this.audioRecorder.start();
      this.$('.start').hide();
      this.$('.stop').show();
      return this.$('.preview').fadeOut();
    };

    RecorderView.prototype.onStopClicked = function(ev) {
      var _this = this;
      ev.preventDefault();
      this.audioRecorder.stop();
      this.updateAudioPreview();
      this.audioRecorder.clear();
      return this.$('.controls').fadeOut(function() {
        return _this.$('.preview').fadeIn();
      });
    };

    RecorderView.prototype.onAgainClicked = function(e) {
      var _this = this;
      e.preventDefault();
      return this.$('.preview').fadeOut(function() {
        return _this.$('.controls').fadeIn();
      });
    };

    RecorderView.prototype.updateAudioPreview = function() {
      return this.audioRecorder["export"](function(blob) {
        var url;
        url = URL.createObjectURL(blob);
        return this.$('audio').attr('src', url);
      });
    };

    return RecorderView;

  })(Backbone.View);

}).call(this);
