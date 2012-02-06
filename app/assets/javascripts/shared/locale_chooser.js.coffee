class LocaleChooserView extends Backbone.View

  tagName: "ul"
  
  events: 
    "mouseover" : "expandAndShowOtherLocales"   
    "mouseout" : "contractAndHideOtherLocales"   
  
  initialize: (opts = {}) ->
    @el= opts.el || $ "ul#available_languages" 
    $(@el).mouseover @expandAndShowOtherLocales
    $(@el).mouseout @contractAndHideOtherLocales
    
    @render()
    
  render: () ->
  
  contractAndHideOtherLocales: () =>
    console.log "LocaleChooserView contract"
    $(@el).find(".locale").hide()
    $(@el).find(".locale.current_locale").show()
  
  expandAndShowOtherLocales: () =>
    console.log "LocaleChooserView expand"
    $(@el).find(".locale").show()
#    $(@el).animate  
  
(exports ? this).LocaleChooserView = LocaleChooserView

