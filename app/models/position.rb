class Position < ApplicationRecord

  has_many :vacancies, dependent:  :delete_all
  has_many :position_criterium_scores, dependent: :delete_all
  validates :name, presence: true

  def to_s
    name
  end


end
