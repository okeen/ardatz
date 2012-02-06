
class CompanyServices extends Backbone.Router

  routes: {
    ''                     : 'index' 
  }
  initialize: ->
    console.log "RouterCompanyServices#init"
    
  index: ->
    console.log "Root"

(exports ? this).CompanyServices = CompanyServices
