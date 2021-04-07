# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

top_chef_seasons = [
  { season_year: 2021, start_date: "2021/04/01", end_date: nil, name: "Portland", season_number: 18, created_at: Time.current, updated_at: Time.current }
]
Season.insert_all(top_chef_seasons)

season = Season.find_by(season_year: 2021)

chefs_2021 = [
  { name: "Brittanny Anderson", city: "Richmond, VA", bio_link: "https://www.bravotv.com/people/brittanny-anderson", job_title: "Chef and Co-Owner of Metzger Bar and Butchery, Brenner Pass, and Black Lodge, Richmond, VA. Leni, Washington, D.C", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Avishar Barua", city: "Columbus, OH", bio_link: "https://www.bravotv.com/people/avishar-barua", job_title: "Executive Chef & GM, Service Bar", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Dawn Burrell", city: "Houston, TX", bio_link: "https://www.bravotv.com/people/dawn-burrell", job_title: "Partner/Executive Chef, Lucille's Hospitality Group", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Gabe Erales", city: "Austin, TX", bio_link: "https://www.bravotv.com/people/gabe-erales", job_title: "Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Nelson German", city: "Oakland, CA", bio_link: "https://www.bravotv.com/people/nelson-german", job_title: "Executive Chef/Owner, alaMar Kitchen and Sobre Mesa Afro-Latino cocktail lounge", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Byron Gomez", city: "Aspen, CO", bio_link: "https://www.bravotv.com/people/byron-gomez", job_title: "Executive Chef at 7908", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sasha Grumman", city: "Houston, TX", bio_link: "https://www.bravotv.com/people/sasha-grumman", job_title: "Executive Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  #{ name: "Roscoe Hall", city: "Birmingham, AL", bio_link: "https://www.bravotv.com/people/roscoe-hall", job_title: "Chef/Artist/Father", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sara Hauman", city: "Portland, OR", bio_link: "https://www.bravotv.com/people/sara-hauman", job_title: "Head Chef, Soter Vineyards", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Kiki Louya", city: "Detroit, MI", bio_link: "https://www.bravotv.com/people/kiki-louya", job_title: "Chef / Consultant", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Maria Mazon", city: "Tucson, AZ", bio_link: "https://www.bravotv.com/people/maria-mazon", job_title: "Executive Chef/Owner, BOCA Tacos y Tequila", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Shota Nakajima", city: "Seattle, WA", bio_link: "https://www.bravotv.com/people/shota-nakajima", job_title: "Chef/Owner, Taku", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Gabriel Pascuzzi", city: "Portland, OR", bio_link: "https://www.bravotv.com/people/gabriel-pascuzzi", job_title: "Chef/Owner, Mama Bird, Stacked Sandwich Shop and Feel Good", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Jamie Tran", city: "Las Vegas, NV", bio_link: "https://www.bravotv.com/people/jamie-tran", job_title: "Chef/Owner, The Black Sheep", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Chris Viaud", city: "Milford, NH", bio_link: "https://www.bravotv.com/people/chris-viaud", job_title: "Chef/Owner of Greenleaf and Culture", season_id: season.id, created_at: Time.current, updated_at: Time.current },
]

chefs_2021.each do |chef|
  Chef.create!(chef)
end

default_scoring_system = {
  qf_win_pts: 1.0,
  qf_fav_pts: 0.5,
  elim_win_pts: 2.0,
  elim_top_pts: 1.0,
  elim_bottom_pts: -0.5,
  lck_win_pts: 0.5,
  lck_champ_pts: 2.0,
  champ_pts: 5.0,
  finale_pts: 5.0,
  sweep_pts: 0.5,
  name: "Default Scoring"
}

ScoringSystem.create!(default_scoring_system)

league = League.create!(
  max_players: 7,
  password: "packurknives",
  password_confirmation: "packurknives",
  season: season,
  name: "Westhoochingdallas"
)

members = [
  { name: "Stephen", email: "stephen.weil@gmail.com", is_admin: true, chefs: [["Gabriel Pascuzzi", 3], ["Byron Gomez", 12]] },
  { name: "Ovais", email: "ovaisinamullah@gmail.com", is_admin: false, chefs: [["Sara Hauman", 1], ["Avishar Barua", 14]] },
  { name: "Scott", email: "saherndon@gmail.com", is_admin: false, chefs: [["Maria Mazon", 7], ["Sasha Grumman", 8]] },
  { name: "Mike", email: "mikelacy3@gmail.com", is_admin: false, chefs: [["Chris Viaud", 5], ["Kiki Louya", 10]] },
  { name: "Andrea", email: "andreareed2007@gmail.com", is_admin: false, chefs: [["Shota Nakajima", 2], ["Jamie Tran", 13]] },
  { name: "Ben", email: "sccrrckstr@gmail.com", is_admin: false, chefs: [["Gabe Erales", 4], ["Nelson German", 11]] },
  { name: "Sana", email: "some@email.com", is_admin: false, chefs: [["Dawn Burrell", 6], ["Brittanny Anderson", 9]] }
]

members.each do |member|
  user = User.create!(member.except(:chefs).merge(password: "packurknives", password_confirmation: "packurknives"))
  league_user = LeagueUser.create!(league: league, user: user, team_name: "#{user.name}'s Team", is_manager: user.name == "Stephen")
  member[:chefs].each do |chef_name, pick_number|
    chef = Chef.find_by(name: chef_name)
    LeagueUserChef.create!(chef: chef, league_user: league_user, pick_number: pick_number)
  end
end

episodes = [
  { season_id: season.id, week: 2, air_date: "4/8/2021", name: "Trouble Brewing" },
# { season_id: season.id, week: 2, air_date: "4/15/2021", name: "Pan African Portland" },
# { season_id: season.id, week: 2, air_date: "4/22/2021", name: "Thrown for a Loop" },
# { season_id: season.id, week: 2, air_date: "4/29/2021", name: "Meet You at the Drive-In" },
# { season_id: season.id, week: 2, air_date: "5/6/2021", name: "Stumptown U.S.A." },
# { season_id: season.id, week: 2, air_date: "", name: "" }
]

episodes.each do |episode|
  ep_record = Episode.create!(episode)
  season.chefs.each do |chef|
    EpisodeChef.create!(episode: ep_record, chef: chef)
  end
end