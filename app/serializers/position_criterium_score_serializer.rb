class PositionCriteriumScoreSerializer
  include JSONAPI::Serializer

  attributes :score

  belongs_to :criterium

end
