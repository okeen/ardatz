
class Session extends Backbone.Model

  defaults: 
    "logged": false
    
  initialize: ->
    if $.cookie("_token_tcg")
      console.log "Session: active tendel cookie found"
      model= $.parseJSON $("#logged_player_bootstrap").html()
      setTimeout () =>
        @sessionLoggedIn model: model, silent: true
      , 500
    else
      console.log "Session: active token NOT found"
      @sessionLoggedOut()
  
  validate: (attrs) ->
  
  sessionChanged: =>
        
  sessionLoggedIn: (opts) =>
    @set 
      "logged": true
      silent: opts.silent || false
    console.log "Session::sessionLoggedIn"
    @model= opts.model
    @trigger "login"
    
  sessionLoggedOut: () =>
    console.log "Session::sessionLoggedOut"
    @set "logged": false
    @trigger "logout"
    
  requestUser:  (callback) =>
    if app.currentUser 
      return callback(app.currentUser)
    if @get "logged"
      app.currentUser = new User(@model)
      return callback(app.currentUser)
      
    app.players.currentUser (user) =>
      app.currentUser = user
      if user
        @sessionLoggedIn()
      else
        @trigger "login:error"
      callback(user)
    
(exports ? this).Session = Session

