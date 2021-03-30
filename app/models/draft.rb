class Draft < ApplicationRecord
  belongs_to :league

  def completed?
    ended_at.present?
  end

  def started?
    Time.now > starts_at
  end
end
