class League < ApplicationRecord
  belongs_to :season

  has_secure_password

  before_create :set_guid!

  validates :name, presence: true
  validates :max_players, numericality: { only_integer: true, greater_than: 1 }

  private

  def set_guid!
    self.guid = SecureRandom.hex(4)
  end
end
