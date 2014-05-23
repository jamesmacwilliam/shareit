# http://emberjs.com/guides/models/using-the-store/
Shareit.Adapter  = DS.RESTAdapter.extend
  bulkCommit: false

Shareit.Store = DS.Store.extend
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  #adapter: '_ams'
  adapter: Shareit.Adapter.create()
