attr = DS.attr
Shareit.Usage = DS.Model.extend
  listing: DS.belongsTo('Shareit.Listing')
  units: attr('string')
  complete: attr('boolean')
  paid: attr('boolean')
