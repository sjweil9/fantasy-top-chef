class Chef < ApplicationRecord
  belongs_to :season
  has_many :episode_chefs

  validates :name, uniqueness: { scope: :season_id }
end
