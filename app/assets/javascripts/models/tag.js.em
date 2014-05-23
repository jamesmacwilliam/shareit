attr = DS.attr
Shareit.Tag = DS.Model.extend
  listings: DS.hasMany('Shareit.Listing')
  tagInterests: DS.hasMany('Shareit.TagInterest')

  name: attr('string')
  tag_id: attr('string')
