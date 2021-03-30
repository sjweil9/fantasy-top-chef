class League < ApplicationRecord
  belongs_to :season

  has_secure_password

  before_validation :set_guid!, on: :create
  after_create :set_default_scoring!

  validates :name, :guid, presence: true
  validates :max_players, numericality: { only_integer: true, greater_than: 1 }

  has_many :league_users, dependent: :destroy
  has_many :users, through: :league_users, dependent: :destroy
  has_one :league_scoring_system
  has_one :scoring_system, through: :league_scoring_system
  
  def teams_in_rank_order
    @teams_in_rank_order ||= league_users.joins(:user).order(total_points: :desc).all
  end

  def chefs_in_rank_order
    @chefs_in_rank_order ||= season.chefs.sort_by { |chef| -scoring_system.season_points_for(chef) }
  end

  def team_size
    season.chefs.count / max_players
  end

  private

  def set_guid!
    self.guid = SecureRandom.hex(4)
  end

  def set_default_scoring!
    return if scoring_system

    default_system = ScoringSystem.find_by!(name: "Default Scoring")
    LeagueScoringSystem.create!(league: self, scoring_system: default_system)
  end
end
