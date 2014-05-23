Shareit.ListingsRoute = Ember.Route.extend
  needs: ['interests']

  model: ->
    #console.log @get('controllers.interests.model')
    Shareit.Listing.find()
    Shareit.Listing.filter (listing) ->
      !listing.get('isNew')
