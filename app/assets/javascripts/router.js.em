Shareit.Router.map ->
  @resource 'interests', ->
    @resource 'interest', {path: ':interest_id'}, ->
      @route 'edit'
      @route 'show'
  @resource 'listings', ->
    @route 'new'
    @resource 'listing', {path: ':listing_id'}, ->
      @route 'edit'
