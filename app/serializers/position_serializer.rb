class PositionSerializer
  include JSONAPI::Serializer

  attributes :name, :created_at

  # TODO: specify meta data with score values
  # has_many :position_criterium_scores

end
