Shareit.Tag = DS.Model.extend
  attr = DS.attr
  listings: DS.hasMany('listing')

  name: attr('string')
  tag_id: attr('string')
