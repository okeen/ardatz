$ ->
  @locales= new LocaleChooserView()
  page = $("body").data("page");
  if "object" == typeof window[page]
    window[page].init()
  
  app.router = new TeamRoutes
  Backbone.history.start()