class VacancySerializer
  include JSONAPI::Serializer

  attributes :status, :opening_date, :closing_date

  belongs_to :position, meta: Proc.new{|v, params|
    {name: v.position.name}
  }

end
