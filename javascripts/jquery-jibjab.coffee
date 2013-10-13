###
jQuery JibJab v0.1

Author:   Richard Venneman
URL:      www.vnn.mn
###

(($) ->
  pluginName = 'jibjab'
  
  defaults =
    speed: 60
    gasping: true
    commaDelay: 200
    dotsDelay: 140
    eolDelay: 700
  
  class JibJab
    constructor: (element, options) ->
      @element = ($ element)
      @options = $.extend {}, defaults, options
      
      @idx = 0
      @chars = (@options.text or @element.text()).split ''
      @element.empty()
      
      console.log 'JibJab warning: target element is empty and no text has been passed.' if not @chars.length
      
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
          @element.trigger 'progress', Math.ceil((@idx / @chars.length) * 100)
        else
          clearInterval @ticker
          @element.trigger 'finished'
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
)(jQuery)