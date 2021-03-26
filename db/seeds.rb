# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

Season.delete_all

top_chef_seasons = [
  { season_year: 2021, start_date: "2021/04/01", end_date: nil, name: "Portland", season_number: 18, created_at: Time.current, updated_at: Time.current }
]
Season.insert_all(top_chef_seasons)
