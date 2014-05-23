attr = DS.attr
Shareit.Address = DS.Model.extend
  street: attr('string')
  city: attr('string')
  state: attr('string')
  country: attr('string')
  zip: attr('string')
  default: attr('boolean')
