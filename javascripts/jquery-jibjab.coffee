###
jQuery JibJab v0.7

Author:   Richard Venneman
URL:      www.richardvenneman.nl
###

(($, window, document) ->
  pluginName = 'jibjab'
  
  defaults =
    speed: 65
    gasping: true
    commaDelay: 200
    dotsDelay: 140
    eolDelay: 700
  
  class JibJab
    constructor: (element, options) ->
      @element = ($ element)
      @options = $.extend {}, defaults, options
      
      @idx = 0
      @chars = @options.text.split ''
      
      @tick()
    
    tick: ->
      @ticker = setInterval =>
        unless @idx is @chars.length
          char = @chars[@idx]
          
          if @options.gasping
            if @chars[@idx - 1] is ',' and char is ' '
              @delayTickWith @options.commaDelay
            else if char is '.' and @chars[@idx + 1] is '.'
              @delayTickWith @options.dotsDelay
            else if char is '.' and @chars[@idx - 1] isnt '.' and @chars[@idx + 1] is ' '
              @delayTickWith @options.eolDelay
          
          @element.append @chars[@idx]
          @idx += 1
      , @options.speed
    
    delayTickWith: (delay) ->
      clearInterval @ticker
      setTimeout =>
        @tick()
      , delay
  
  $.fn[pluginName] = (options) ->
    this.each ->
      if !$.data(this, "plugin_#{pluginName}")
        $.data(this, "plugin_#{pluginName}", new JibJab(this, options))
)(jQuery, window, document)