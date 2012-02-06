
#
# The regions used by the application
#

class UserCollection extends PaginatedCollection

  url: ->
    "/admin/users"

  currentUser: (callback)->
    $.ajax
      url: "#{@url()}current.json"
      success: (response) =>
        user= new User(response)
        callback(user) if callback
      error: (self) =>
        callback() if callback
        
  model: User
 

(exports ? this).UserCollection = UserCollection
