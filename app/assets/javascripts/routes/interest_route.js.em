Shareit.InterestRoute = Ember.Route.extend
  model: (opts) ->
    Shareit.TagInterest.find(opts.interest_id)
