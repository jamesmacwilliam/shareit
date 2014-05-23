attr = DS.attr
Shareit.Geography = DS.Model.extend
  listings: DS.hasMany('Shareit.Listing')
  start_address: DS.belongsTo('Shareit.Address')
  end_address: DS.belongsTo('Shareit.Address')
  miles_to_travel: attr('string')
  willing_to_travel_across_state_line: attr('string')
  state_line_fee: attr('string')
