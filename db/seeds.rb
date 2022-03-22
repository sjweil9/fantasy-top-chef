# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

top_chef_seasons = [
  { season_year: 2021, start_date: "2021/04/01", end_date: nil, name: "Portland", season_number: 18, created_at: Time.current, updated_at: Time.current },
  { season_year: 2022, start_date: "2021/03/03", end_date: nil, name: "Houston", season_number: 19, created_at: Time.current, updated_at: Time.current }
]
Season.insert_all(top_chef_seasons)

season = Season.find_by(season_year: 2022)

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

chefs_2022 = [
  { name: "Ashleigh Shanti", city: "Virginia Beach, VA", bio_link: "https://www.bravotv.com/people/ashleigh-shanti", job_title: "Chef/Owner, Good Hot Fish", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Buddha Lo", city: "Port Douglas, Australia", bio_link: "https://www.bravotv.com/people/buddha-lo", job_title: "Executive Chef, Marky’s Caviar & Huso", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Damarr Brown", city: "Chicago, IL", bio_link: "https://www.bravotv.com/people/damarr-brown", job_title: "Chef de Cuisine, Virtue", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Evenlyn Garcia", city: "Houston, TX", bio_link: "https://www.bravotv.com/people/evelyn-garcia", job_title: "Chef/Co-Owner, Kin HTX", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Jackson Kalb", city: "Los Angeles, CA", bio_link: "https://www.bravotv.com/people/jackson-kalb", job_title: "Chef/Owner, Jame Enoteca & Ospi; Chef/Partner at Wake & Late", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Jo Chan", city: "Palmdale, California", bio_link: "https://www.bravotv.com/people/jo-chan", job_title: "Executive Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Luke Koplin", city: "Seattle, WA", bio_link: "https://www.bravotv.com/people/luke-kolpin", job_title: "Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Monique Feybesse", city: "San Francisco, CA", bio_link: "https://www.bravotv.com/people/monique-feybesse", job_title: "Chef/Owner of Tarts de Feybesse", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Nick Wallace", city: "Edwards, MS", bio_link: "https://www.bravotv.com/people/nick-wallace", job_title: "Chef, Nick Wallace Culinary", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Robert Hernandez", city: "Downey, CA", bio_link: "https://www.bravotv.com/people/robert-hernandez", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sam Kang", city: "Gardena, California", bio_link: "https://www.bravotv.com/people/sam-kang", job_title: "Chef Educator", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sarah Welch", city: "Ann Arbor, MI", bio_link: "https://www.bravotv.com/people/sarah-welch", job_title: "Executive Chef, Marrow & Partner, Mink", season_id: season.id, created_at: Time.current, updated_at: Time.current }
]

chefs_2022.each do |chef|
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
  name: "Default Scoring",
  survival: 0.5
}

ScoringSystem.create!(default_scoring_system)

league = League.create!(
  max_players: 6,
  password: "packurknives",
  password_confirmation: "packurknives",
  season: season,
  name: "Westhoochingdallas"
)

members = [
  { name: "Stephen", email: "stephen.weil@gmail.com", is_admin: true, chefs: [["Monique Feybesse", 3], ["Nick Wallace", 10]] },
  { name: "Ovais", email: "ovaisinamullah@gmail.com", is_admin: false, chefs: [["Buddha Lo", 5], ["Sarah Welch", 8]] },
  { name: "Scott", email: "saherndon@gmail.com", is_admin: false, chefs: [["Damarr Brown", 1], ["Luke Koplin", 12]] },
  { name: "Andrea", email: "andreareed2007@gmail.com", is_admin: false, chefs: [["Robert Hernandez", 4], ["Jo Chan", 9]] },
  { name: "Ben", email: "sccrrckstr@gmail.com", is_admin: false, chefs: [["Jackson Kalb", 2], ["Sam Kang", 11]] },
  { name: "Jessica", email: "some@email.com", is_admin: false, chefs: [["Ashleigh Shanti", 6], ["Evelyn Garcia", 7]] }
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
  #{ season_id: season.id, week: 2, air_date: "4/8/2021", name: "Trouble Brewing" },
  { season_id: season.id, week: 3, air_date: "3/17/2022", name: "Noodles and Rice and Everything Nice" },
# { season_id: season.id, week: 2, air_date: "", name: "" }
]

episodes.each do |episode|
  ep_record = Episode.create!(episode)
end