chai = require('chai').should()
sinon = require 'sinon'
jsdom = require 'jsdom'
jQuery = require 'jQuery'

window = jsdom.jsdom('<html><body></body></html>').createWindow()
document = window.document

$ = global.jQuery = jQuery.create window
require '../javascripts/jquery-jibjab.js'

hlq = "Rise and shine, Mister Freeman. Rise and... shine. Not that I... wish to imply you have been sleeping on the job. No one is more deserving of a rest, and all the effort in the world would have gone to waste until... well, let's just say your hour has... come again."

describe 'JibJab plugin', ->
  
  describe 'Initialization', ->
    
    it 'should be initialized', ->
      quote = ($ '<quote />').appendTo 'body'
      quote.jibjab(text: hlq)
      
      quote.data('plugin_jibjab').should.be.a 'object'
    
    it 'should initialize without arguments, using innerHTML as text', ->
      quote = ($ "<quote>#{hlq}</quote>").appendTo 'body'
      quote.jibjab()
      
      quote.data('plugin_jibjab').should.be.a 'object'
  
  describe 'Callbacks', ->
    before ->
      @clock = sinon.useFakeTimers()
      @txt = 'Rise and shine'
    
    after ->
      @clock.restore()
    
    it 'should invoke the progress callback after every tick', ->
      callback = sinon.spy()
      
      quote = ($ '<quote />').appendTo 'body'
      quote.jibjab { text: @txt, speed: 10 }
      quote.on 'progress', callback
      
      @clock.tick 10
      callback.calledOnce.should.equal true
      
      @clock.tick (@txt.length - 2) * 10
      callback.callCount.should.equal @txt.length - 1
      
      @clock.tick 10
      callback.callCount.should.equal @txt.length
      
      @clock.tick 10
      callback.callCount.should.equal @txt.length
    
    it 'should invoke the finished callback after displaying every character', ->
      callback = sinon.spy()
      
      quote = ($ '<quote />').appendTo 'body'
      quote.jibjab { text: @txt, speed: 10 }
      quote.on 'finished', callback
      
      @clock.tick @txt.length * 10
      callback.called.should.equal false
      
      @clock.tick 10
      callback.called.should.equal true