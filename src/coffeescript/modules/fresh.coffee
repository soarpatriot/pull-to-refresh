$ = jQuery = require "jQuery"
Spiner = require "./spin.js"

options =
          url: "http://api.dreamreality.cn/v1/posts.json"
          data: null
          callback: (response) ->
            console.log response
fa = ->
  Fresh 


f = (root,factory) ->
  if typeof define == "function" && define.amd
    define ["refresh"], ->
      factory
  else if typeof module == "object" && module.exports
    console.log "object"
    module.exports = factory()
  else
    root.Refresh = Fresh

f(this,fa)


class Fresh
  constructor: (options) ->
    @el =
          container: $(".water")
          window: $(window)
          document: $(document)
          spinnerContainer: $(".spinner-container")
               
    @options = $.extends({},options)
    #    url: options.url
    #    data: options.data
    #    callback: options.callback
    @spinner = new Spiner()
    @init()
    @addListener()

  init: ->

  addListener: ->
    console.log "lisnter"

    @el.window.bind "scroll", =>
      scrollTop = @el.window.scrollTop()
      scrollHeight = @el.document.height()
      windowHeight = @el.window.height()
      if (scrollTop + windowHeight) >= scrollHeight
        @spinner.spin()
        @el.spinnerContainer.append(@spinner.el)
        @load()
        console.log "scroll down the bottom"
  
  load: ->
    console.log options.url
    $.ajax(
      url: @options.url
      success: @success
      dataType: "json"
    )
    console.log "loading"

  success: (response) =>
    @options.callback.call(null,response)
    # console.log response
    @spinner.stop()
  


