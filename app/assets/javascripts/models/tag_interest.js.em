Shareit.TagInterest = DS.Model.extend
  tags: DS.hasMany(Shareit.Tag)
  listings: DS.hasMany(Shareit.Listing)
  listings_count: DS.attr('string')
  desc: DS.attr('string')
