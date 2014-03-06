Shareit.Address = DS.Model.extend
  attr = DS.attr
  street: attr('string')
  city: attr('string')
  state: attr('string')
  country: attr('string')
  zip: attr('string')
  user_id: attr('string')
  default: attr('boolean')
