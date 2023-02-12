class Vacancy < ApplicationRecord

  scope :opened, -> { where(status: false) }
  scope :closed, -> { where(status: true) }

  # status true = closed, false = opened

  belongs_to :position
  has_many :candidates

  before_save :set_opening_date

  def status_name
    status ? "Закрыта" : "Открыта"
  end

  def close!
    ActiveRecord::Base.transaction do
      self.status = true
      self.closing_date = Date.today
      self.save!
    end
  end

  def to_s
    "Вакансия №#{id}: #{position.name}"
  end

  private

  def set_opening_date
    self.opening_date = Time.now
  end

end
