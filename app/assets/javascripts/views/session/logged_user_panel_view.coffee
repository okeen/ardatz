class LoggedUserPanelView  extends Backbone.View

  events: {} 
       
  initialize: (opts) ->
    @template= _.template $("#logged-user-panel-template").html()
        
  render: () ->
    $(@el).append @template()
  
  show: () ->
    console.log "LoggedUserPanelView#show"
  
  hide: () ->
    console.log "LoggedUserPanelView#hide"
  
(exports ? this).LoggedUserPanelView = LoggedUserPanelView 
