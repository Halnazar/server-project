class Criterium < ApplicationRecord

  has_many :position_criterium_scores, dependent: :delete_all
      validates :name, presence: true

  has_many :candidate_criterium_scores
end
