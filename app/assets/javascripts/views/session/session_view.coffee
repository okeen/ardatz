class SessionView  extends Backbone.View

  events: {}
  
  initialize: (opts = {}) ->
    @el= opts.el || $("#user_session_panel")[0]
    @model.bind "login", @loggedIn
    @model.bind "login:error", @loggedOut
    @model.bind "logout", @loggedOut
    @loginPanelView = new LoginPanelView 
        el: $(@el).find(".login_panel")[0] 
    @loggedUserPanelView = new LoggedUserPanelView 
        el: $(@el).find(".logged_user_panel")[0] 
    
  render: () ->
    @loginPanelView.render()     
    @loggedUserPanelView.render()
    
  loggedIn: () =>
    console.log "SessionView::loggedIn"
    @loginPanelView.hide()
    @loggedUserPanelView.show()
  
  loggedOut: () =>
    console.log "SessionView::loggedOut"
    @loginPanelView.show()
    @loggedUserPanelView.hide()
  
  open: () =>
  
  close: () =>
  
  
  
(exports ? this).SessionView = SessionView 
