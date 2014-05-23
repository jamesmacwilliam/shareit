Shareit.InterestsRoute = Ember.Route.extend
  model: ->
    Shareit.TagInterest.find()
    Shareit.TagInterest.filter (interest) ->
      !interest.get('isNew')
