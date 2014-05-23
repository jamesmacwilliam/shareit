module UuidConvertable
  extend ActiveSupport::Concern

  included do
    before_save :handle_int_id
  end

  def as_json(opts = {})
    as_json_sub(opts).merge id: json_id
  end

  def json_id
    UUIDTools::UUID.parse(self.id).to_i.to_s
  end

  def handle_int_id(opts)
    if self.id.is_a?(Integer)
      self.json_id = self.id
    end
  end

  def int_to_id(id_val)
    UUIDTools::UUID.parse_int(id_val).to_s
  end
end
