class CandidateSerializer
  include JSONAPI::Serializer

  attributes :first_name, :second_name, :email, :number,
             :expirience_years, :biography,
             :status,  :gender

  attribute :avatar do |object|
    "#{Rails.application.routes.url_helpers.rails_blob_path(object.avatar) if object.avatar.attached?}"
  end

  attribute :created_at do |candidate|
    candidate.created_at.to_date
  end

  meta do |candidate|
    {
      score_sum: candidate.score_sum,
      score_max_sum: candidate.candidate_criterium_scores.count*5
    }
  end

  belongs_to :vacancy, meta: Proc.new { |candidate, params|  {position_name: candidate.vacancy.position.name,
                                                              opening_date: candidate.vacancy.opening_date} }

  has_many :candidate_criterium_scores, meta: Proc.new { |candidate, params|
    h = {criterium_scores: []}
    candidate.candidate_criterium_scores.each do |cc|
      h[:criterium_scores] << {
        name: cc.criterium.name,
        value_candidate: cc.score,
        value_position: PositionCriteriumScore.find_by(
          position: cc.candidate.vacancy.position,
          criterium: cc.criterium
        ).score
      }
    end

    h
  }

  belongs_to :user

end
