$ = jQuery = require "jQuery"
Spiner = require "./modules/spin.js"

 
require "jQuery"
require "./modules/home.coffee"
Refresh = require "./modules/fresh.coffee"


options =
          url: "http://api.dreamreality.cn/v1/posts.json"
          data: null
          callback: (response) ->
            console.log response
console.log Refresh
window.Refresh = Refresh
aa = new Refresh(options)


