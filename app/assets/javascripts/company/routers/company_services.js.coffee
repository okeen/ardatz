
class CompanyShow extends Backbone.Router

  routes: {
    ''                     : 'index' 
  }
  initialize: ->
    console.log "Initialized CompanyServices"
    
  index: ->
    console.log "Root"

(exports ? this).CompanyServices = CompanyServices
