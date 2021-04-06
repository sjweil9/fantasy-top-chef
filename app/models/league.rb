class League < ApplicationRecord
  belongs_to :season

  has_secure_password validations: false

  before_validation :set_guid!, on: :create
  after_create :set_default_scoring!

  validates :name, :guid, presence: true
  validates :max_players, numericality: { only_integer: true, greater_than: 1 }
  validate :player_count_allowed!

  has_many :league_users, dependent: :destroy
  has_many :users, through: :league_users, dependent: :destroy
  has_many :league_user_chefs, through: :league_users
  has_many :chefs, through: :league_user_chefs
  has_one :league_scoring_system, dependent: :destroy
  has_one :scoring_system, through: :league_scoring_system, dependent: :destroy
  has_one :draft
  
  def teams_in_rank_order
    @teams_in_rank_order ||= calculate_rank_order
  end

  def chefs_in_rank_order
    @chefs_in_rank_order ||= calculate_chef_rank_order
  end

  def players_in_draft_order
    @players_in_draft_order ||= draft&.pick_order&.map do |id|
      league_users.detect { |lu| lu.user_id == id }
    end || []
  end

  def team_size
    season.chefs.count / max_players
  end

  def private?
    password_digest.present?
  end

  def at_max_players?
    league_users.count >= max_players
  end

  def draft_completed?
    draft&.completed?
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

  def player_count_allowed!
    return if league_users.count <= max_players

    errors.add(:max_players, "cannot be reduced to the requested amount as there are already too many members.")
  end

  def calculate_rank_order
    rank = 1
    current_points = 0
    league_users.joins(:user).order(total_points: :desc).all.map do |league_user|
      if league_user.total_points > current_points
        rank += 1
        current_points = league_user.total_points
      end
      [league_user, rank]
    end
  end

  def calculate_chef_rank_order
    rank = 1
    current_points = 0
    season.chefs.sort_by { |chef| [-scoring_system.season_points_for(chef), chef.name.split(" ").last] }.map do |chef|
      if scoring_system.season_points_for(chef) > current_points
        rank += 1
        current_points = scoring_system.season_points_for(chef)
      end
      team_name = league_users.detect { |lu| lu.chefs.include?(chef) }.team_name
      [chef, team_name, scoring_system.season_points_for(chef), rank]
    end
  end
end
