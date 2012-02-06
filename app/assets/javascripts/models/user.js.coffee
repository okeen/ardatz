
class User extends Backbone.Model

  defaults: {
    "email": null
    "name": null
  }

  url: ->
    "/users/#{@id}"
    
  initialize: ->

  validate: (attrs) ->
   

(exports ? this).User = User
