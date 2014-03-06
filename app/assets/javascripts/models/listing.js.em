Shareit.Listing = DS.Model.extend
  attr = DS.attr
  desc: attr('string')
  listing_start: attr('date')
  listing_end: attr('date')
  photos: attr('array')
  rate: attr('string')
  rate_type: attr('string')
  deposit: attr('string')
  listing_id: attr('string')
  geography_id: attr('string')
