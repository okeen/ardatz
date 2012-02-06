
class CompanyHome extends Backbone.Router

  routes: {
    ''                     : 'index' 
  }
  initialize: ->
    console.log "Initialized CompanyServices"

  index: ->
    console.log "CompanyServices#index"

(exports ? this).CompanyHome = CompanyHome
