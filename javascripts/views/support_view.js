// Generated by CoffeeScript 1.6.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  App.Views.SupportView = (function(_super) {

    __extends(SupportView, _super);

    function SupportView() {
      return SupportView.__super__.constructor.apply(this, arguments);
    }

    SupportView.prototype.el = '.support_view';

    SupportView.prototype.template = "<ul class=\"support\"></ul>";

    SupportView.prototype.render = function() {
      this.$el.html(this.template);
      if (!this.model.get('audioContext') && !this.model.get('getUserMedia')) {
        this.unsupported('AudioContext');
        return this.unsupported('getUserMedia');
      } else if (!this.model.get('audioContext')) {
        this.unsupported('AudioContext');
        return this.supported('getUserMedia');
      } else if (!this.model.get('getUserMedia')) {
        this.unsupported('getUserMedia');
        return this.supported('AudioContext');
      } else {
        this.supported('AudioContext');
        return this.supported('getUserMedia');
      }
    };

    SupportView.prototype.supported = function(item) {
      return this.$('.support').append("<li class='supported'><span class='fontawesome-ok icon'></span>" + item + "</li>");
    };

    SupportView.prototype.unsupported = function(item) {
      return this.$('.support').append("<li class='unsupported'><span class='fontawesome-remove-sign icon'></span>" + item + "</li>");
    };

    return SupportView;

  })(Backbone.View);

}).call(this);
