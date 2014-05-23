attr = DS.attr
Shareit.Listing = DS.Model.extend
  usage: DS.belongsTo('Shareit.Usage')
  geography: DS.belongsTo('Shareit.Geography')
  tags: DS.hasMany('Shareit.Tag')
  tagInterests: DS.hasMany('Shareit.TagInterest')

  desc: attr('string')
  listing_start: attr('date')
  listing_end: attr('date')
  #need to convert this to an array
  photos: attr('string')
  rate: attr('string')
  rate_type: attr('string')
  deposit: attr('string')
