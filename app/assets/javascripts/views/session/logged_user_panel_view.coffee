class LoggedUserPanelView  extends Backbone.View

  events: {} 
       
  initialize: (opts) ->
    @template= _.template $("#logged-user-panel-template").html()
        
  render: () ->
    $(@el).append @template()
  
  show: () ->
    console.log "LoggedUserPanelView#show"
    $(@el).show()
    
  hide: () ->
    console.log "LoggedUserPanelView#hide"
    $(@el).hide()
    
(exports ? this).LoggedUserPanelView = LoggedUserPanelView 
