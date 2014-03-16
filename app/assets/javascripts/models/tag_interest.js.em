Shareit.Listing = DS.Model.extend
  attr = DS.attr
  user: DS.belongsTo('user')
  tag_ids: attr('array')
