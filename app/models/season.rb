class Season < ApplicationRecord
  has_many :episodes
  has_many :chefs
end
