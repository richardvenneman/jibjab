// Generated by CoffeeScript 1.4.0
/*
jQuery JibJab v0.7

Author:   Richard Venneman
URL:      www.richardvenneman.nl
*/

(function($) {
  var JibJab, defaults, pluginName;
  pluginName = 'jibjab';
  defaults = {
    speed: 60,
    gasping: true,
    commaDelay: 200,
    dotsDelay: 140,
    eolDelay: 700
  };
  JibJab = (function() {

    function JibJab(element, options) {
      this.element = $(element);
      this.options = $.extend({}, defaults, options);
      this.idx = 0;
      this.chars = (this.options.text || this.element.text()).split('');
      this.element.empty();
      if (!this.chars.length) {
        console.log('JibJab warning: target element is empty and no text has been passed.');
      }
      this.tick();
    }

    JibJab.prototype.tick = function() {
      var _this = this;
      return this.ticker = setInterval(function() {
        var char;
        if (_this.idx !== _this.chars.length) {
          char = _this.chars[_this.idx];
          if (_this.options.gasping) {
            if (_this.chars[_this.idx - 1] === ',' && char === ' ') {
              _this.delayTickWith(_this.options.commaDelay);
            } else if (char === '.' && _this.chars[_this.idx + 1] === '.') {
              _this.delayTickWith(_this.options.dotsDelay);
            } else if (char === '.' && _this.chars[_this.idx - 1] !== '.' && _this.chars[_this.idx + 1] === ' ') {
              _this.delayTickWith(_this.options.eolDelay);
            }
          }
          _this.element.append(_this.chars[_this.idx]);
          _this.idx += 1;
          return _this.element.trigger('progress', Math.ceil((_this.idx / _this.chars.length) * 100));
        } else {
          clearInterval(_this.ticker);
          return _this.element.trigger('finished');
        }
      }, this.options.speed);
    };

    JibJab.prototype.delayTickWith = function(delay) {
      var _this = this;
      clearInterval(this.ticker);
      return setTimeout(function() {
        return _this.tick();
      }, delay);
    };

    return JibJab;

  })();
  return $.fn[pluginName] = function(options) {
    return this.each(function() {
      if (!$.data(this, "plugin_" + pluginName)) {
        return $.data(this, "plugin_" + pluginName, new JibJab(this, options));
      }
    });
  };
})(jQuery);
