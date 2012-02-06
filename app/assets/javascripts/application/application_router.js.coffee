
class ApplicationRoutes extends Backbone.Router

  routes: {
    }
    
  initialize: ->
      
  init: ->
    console.log "AppRoutes#init"
    @locales= new LocaleChooserView()
  
    @session = new Session
    @sessionView= new SessionView 
      model: @session
      el: $("#user_session_panel")[0]
      
$  ->
  window.app= new ApplicationRoutes
  app.init()
  page = $("body").data("page");
  if window[page]
    app.router= new window[page]
    Backbone.history.start()
    