class LoginPanelView  extends Backbone.View

  events: {} 
       
  initialize: (opts) ->
    @template= _.template $("#login-panel-template").html()
    
  render: () ->
    $(@el).append @template()
    
  show: () ->
    console.log "LoginPanelView#show"
    $(@el).show()
    
  hide: () ->
    console.log "LoginPanelView#hide"
    $(@el).hide()
    
  
(exports ? this).LoginPanelView = LoginPanelView 
