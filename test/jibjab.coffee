chai = require('chai').should()
jsdom = require 'jsdom'
jQuery = require 'jQuery'

window = jsdom.jsdom('<html><body></body></html>').createWindow()
document = window.document

$ = global.jQuery = jQuery.create window
require '../javascripts/jquery-jibjab.js'

hlq = "Rise and shine, Mister Freeman. Rise and... shine. Not that I... wish to imply you have been sleeping on the job. No one is more deserving of a rest, and all the effort in the world would have gone to waste until... well, let's just say your hour has... come again."

describe 'JibJab plugin', ->
  describe 'Initialization', ->
    beforeEach ->
      @quote = ($ "<quote />").appendTo 'body'
    
    it 'should be initialized', ->
      @quote.jibjab(text: hlq)
      @quote.data('plugin_jibjab').should.be.a 'object'
    
    it 'should initialize without arguments, using innerHTML as text', ->
      @quote.jibjab()
      @quote.data('plugin_jibjab').should.be.a 'object'