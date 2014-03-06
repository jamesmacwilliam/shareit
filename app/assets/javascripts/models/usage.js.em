Shareit.Usage = DS.Model.extend
  attr = DS.attr
  listing_id: attr('string')
  units: attr('string')
  user_id: attr('string')
  complete: attr('boolean')
  paid: attr('boolean')
