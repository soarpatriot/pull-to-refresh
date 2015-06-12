
$ = jQuery = require "jQuery"

class Fresh
  constructor: ->
    @el =
          container: $(".water")
          window: $(window)
          document: $(document)

    @init()
    @addListener()

  init: ->
    console.log "init"
  
  addListener: ->
    console.log "lisnter"

    @el.window.bind "scroll", =>
      scrollTop = @el.window.scrollTop()
      scrollHeight = @el.document.height()
      windowHeight = @el.window.height()
      if (scrollTop + windowHeight) >= scrollHeight
        console.log "scroll down the bottom"
    
module.exports = new Fresh

