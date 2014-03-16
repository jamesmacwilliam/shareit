Shareit.Geography = DS.Model.extend
  attr = DS.attr
  listings: DS.hasMany('listing')
  user: DS.belongsTo('user')

  start_address_id: attr('string')
  end_address_id: attr('string')
  miles_to_travel: attr('string')
  willing_to_travel_across_state_line: attr('string')
  state_line_fee: attr('string')
