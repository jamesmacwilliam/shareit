Shareit.Router.map ->
  @route 'new_listing', {path: '/listing/new'}

  @resource 'listing', {path: '/listing/:listing_id'}, ->
    @route 'edit'
