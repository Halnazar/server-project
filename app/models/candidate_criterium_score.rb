class CandidateCriteriumScore < ApplicationRecord

    belongs_to :candidate
    belongs_to :criterium

    validates :score, inclusion: { in: 1..5 ,
                 message: "(%{value}) can't be less 1 and more 5" }

    validates :score, presence: true
    validates :candidate_id, uniqueness: { scope: :criterium_id }
end
