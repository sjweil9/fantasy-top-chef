class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  has_many :league_users
  has_many :leagues, through: :league_users

  def is_manager?(league)
    LeagueUser.where(league_id: league.id, user_id: id, is_manager: true).count.positive?
  end

  def is_member?(league)
    LeagueUser.where(league_id: league.id, user_id: id).count.positive?
  end
end
