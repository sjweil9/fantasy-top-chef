class Draft < ApplicationRecord
  belongs_to :league

  def completed?
    ended_at.present?
  end
end
