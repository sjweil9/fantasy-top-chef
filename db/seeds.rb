# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

top_chef_seasons = [
  #{ season_year: 2021, start_date: "2021/04/01", end_date: nil, name: "Portland", season_number: 18, created_at: Time.current, updated_at: Time.current },
  #{ season_year: 2022, start_date: "2021/03/03", end_date: nil, name: "Houston", season_number: 19, created_at: Time.current, updated_at: Time.current },
  #{ season_year: 2023, start_date: "2023/03/09", end_date: nil, name: "London", season_number: 20, created_at: Time.current, updated_at: Time.current },
  #{ season_year: 2024, start_date: "2024/03/20", end_date: nil, name: "Wisconsin", season_number: 21, created_at: Time.current, updated_at: Time.current }
  { season_year: 2025, start_date: "2025/03/13", end_date: nil, name: "Canada", season_number: 22, created_at: Time.current, updated_at: Time.current }
]
Season.insert_all(top_chef_seasons)

season = Season.find_by(season_year: 2025)

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
  { name: "Evelyn Garcia", city: "Houston, TX", bio_link: "https://www.bravotv.com/people/evelyn-garcia", job_title: "Chef/Co-Owner, Kin HTX", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Jackson Kalb", city: "Los Angeles, CA", bio_link: "https://www.bravotv.com/people/jackson-kalb", job_title: "Chef/Owner, Jame Enoteca & Ospi; Chef/Partner at Wake & Late", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Jo Chan", city: "Palmdale, California", bio_link: "https://www.bravotv.com/people/jo-chan", job_title: "Executive Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Luke Koplin", city: "Seattle, WA", bio_link: "https://www.bravotv.com/people/luke-kolpin", job_title: "Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Monique Feybesse", city: "San Francisco, CA", bio_link: "https://www.bravotv.com/people/monique-feybesse", job_title: "Chef/Owner of Tarts de Feybesse", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Nick Wallace", city: "Edwards, MS", bio_link: "https://www.bravotv.com/people/nick-wallace", job_title: "Chef, Nick Wallace Culinary", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Robert Hernandez", city: "Downey, CA", bio_link: "https://www.bravotv.com/people/robert-hernandez", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sam Kang", city: "Gardena, California", bio_link: "https://www.bravotv.com/people/sam-kang", job_title: "Chef Educator", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sarah Welch", city: "Ann Arbor, MI", bio_link: "https://www.bravotv.com/people/sarah-welch", job_title: "Executive Chef, Marrow & Partner, Mink", season_id: season.id, created_at: Time.current, updated_at: Time.current }
]

chefs_2023 = [
  { name: "Samuel Albert", city: "Angers, France", bio_link: "https://www.bravotv.com/people/samuel-albert", job_title: "Executive Chef/Owner, Les Petits Prés", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Buddha Lo", city: "Port Douglas, Australia", bio_link: "https://www.bravotv.com/people/buddha-lo", job_title: "Executive Chef, Marky’s Caviar & Huso", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Luciana Berry", city: "London, United Kingdom", bio_link: "https://www.bravotv.com/people/luciana-berry", job_title: "Owner, Catering on the Hill", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sara Bradley", city: "Paducah, KY", bio_link: "https://www.bravotv.com/people/sara-bradley", job_title: "Chef/Owner, freight house", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Dawn Burrell", city: "Houston, TX", bio_link: "https://www.bravotv.com/people/dawn-burrell", job_title: "Partner/Executive Chef, Lucille's Hospitality Group", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Ali Ghzawi", city: "Amman, Jordan", bio_link: "https://www.bravotv.com/people/ali-ghzawi", job_title: "Chef/Owner, Alee", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Tom Goetter", city: "Mainz, Germany", bio_link: "https://www.bravotv.com/people/tom-goetter", job_title: "Executive Chef/Director, Food & Beverage Scenic Luxury Cruises Ocean", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Nicole Gomes", city: "Vancouver, British Columbia, Canada", bio_link: "https://www.bravotv.com/people/nicole-gomes", job_title: "Executive Chef/Owner, Cluck ‘N’ Cleaver", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Victoire Gouloubi", city: "Milan, Italy", bio_link: "https://www.bravotv.com/people/victoire-gouloubi", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Charbel Hayek", city: "Lake Worth, Florida", bio_link: "https://www.bravotv.com/people/charbel-hayek", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Dale MacKay", city: "Saskatoon, Saskatchewan, Canada", bio_link: "https://www.bravotv.com/people/dale-mackay", job_title: "Chef/Co-Owner, Grassroots Restaurant Group", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "May Phattanant Thongthong", city: "Bangkok, Thailand", bio_link: "https://www.bravotv.com/people/may-phattanant-thongthong", job_title: "Executive Chef & Co-Partner, MAZE Dining", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Begoña Rodrigo", city: "Valencia, Spain", bio_link: "https://www.bravotv.com/people/begona-rodrigo", job_title: "Executive Chef/Owner, La Salita", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Gabri Rodriguez", city: "Madrid, Spain", bio_link: "https://www.bravotv.com/people/gabriel-rodriguez", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Amar Santana", city: "Santa Ana, CA", bio_link: "https://www.bravotv.com/people/amar-santana", job_title: "Executive Chef/Owner, Broadway by Amar Santana in Laguna Beach, California and Vaca Restaurant in Costa Mesa, California", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Sylwia Stachyra", city: "Lublin, Poland", bio_link: "https://www.bravotv.com/people/sylwia-stachyra", job_title: "Owner, CookShe", season_id: season.id, created_at: Time.current, updated_at: Time.current }
]

chefs_2024 = [
  { name: "Manny Barella", city: "Denver, CO", bio_link: "https://www.bravotv.com/people/samuel-albert", job_title: "Executive Chef/Owner, Les Petits Prés", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Kaleena Bliss", city: "Chicago, IL", bio_link: "https://www.bravotv.com/people/buddha-lo", job_title: "Executive Chef, Marky’s Caviar & Huso", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Kévin D'Andrea", city: "Austin, TX", bio_link: "https://www.bravotv.com/people/luciana-berry", job_title: "Owner, Catering on the Hill", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Alisha Elenz", city: "Chicago, IL", bio_link: "https://www.bravotv.com/people/sara-bradley", job_title: "Chef/Owner, freight house", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Danny Garcia", city: "Brooklyn, NY", bio_link: "https://www.bravotv.com/people/dawn-burrell", job_title: "Partner/Executive Chef, Lucille's Hospitality Group", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Valentine Howell Jr.", city: "Boston, MA", bio_link: "https://www.bravotv.com/people/ali-ghzawi", job_title: "Chef/Owner, Alee", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Dan Jacobs", city: "Milwaukee, WI", bio_link: "https://www.bravotv.com/people/tom-goetter", job_title: "Executive Chef/Director, Food & Beverage Scenic Luxury Cruises Ocean", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Savannah Miller", city: "Durham, NC", bio_link: "https://www.bravotv.com/people/nicole-gomes", job_title: "Executive Chef/Owner, Cluck ‘N’ Cleaver", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Kenny Nguyen", city: "Athens, GA", bio_link: "https://www.bravotv.com/people/victoire-gouloubi", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Laura Ozyilmaz", city: "San Francisco, CA", bio_link: "https://www.bravotv.com/people/charbel-hayek", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Charly Pierre", city: "New Orleans, LA", bio_link: "https://www.bravotv.com/people/dale-mackay", job_title: "Chef/Co-Owner, Grassroots Restaurant Group", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Amanda Turner", city: "Austin, TX", bio_link: "https://www.bravotv.com/people/may-phattanant-thongthong", job_title: "Executive Chef & Co-Partner, MAZE Dining", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Rasika Venkatesa", city: "New York, NY", bio_link: "https://www.bravotv.com/people/begona-rodrigo", job_title: "Executive Chef/Owner, La Salita", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Michelle Wallace", city: "Houston, TX", bio_link: "https://www.bravotv.com/people/gabriel-rodriguez", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
]

chefs_2025 = [
  { name: "Anya El-wattar", city: "Denver, CO", bio_link: "https://www.bravotv.com/people/samuel-albert", job_title: "Executive Chef/Owner, Les Petits Prés", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Bailey Sullivan", city: "Chicago, IL", bio_link: "https://www.bravotv.com/people/buddha-lo", job_title: "Executive Chef, Marky’s Caviar & Huso", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Cesar Murillo", city: "Austin, TX", bio_link: "https://www.bravotv.com/people/luciana-berry", job_title: "Owner, Catering on the Hill", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Paula Larrea", city: "Chicago, IL", bio_link: "https://www.bravotv.com/people/sara-bradley", job_title: "Chef/Owner, freight house", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Tristen Epps", city: "Brooklyn, NY", bio_link: "https://www.bravotv.com/people/dawn-burrell", job_title: "Partner/Executive Chef, Lucille's Hospitality Group", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Corwin Hemming", city: "Boston, MA", bio_link: "https://www.bravotv.com/people/ali-ghzawi", job_title: "Chef/Owner, Alee", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Katianna Hong", city: "Milwaukee, WI", bio_link: "https://www.bravotv.com/people/tom-goetter", job_title: "Executive Chef/Director, Food & Beverage Scenic Luxury Cruises Ocean", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Lana Lagomarsini", city: "Durham, NC", bio_link: "https://www.bravotv.com/people/nicole-gomes", job_title: "Executive Chef/Owner, Cluck ‘N’ Cleaver", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Henry Lu", city: "Athens, GA", bio_link: "https://www.bravotv.com/people/victoire-gouloubi", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Vincenzo Loseto", city: "San Francisco, CA", bio_link: "https://www.bravotv.com/people/charbel-hayek", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Zubair Mohajir", city: "New Orleans, LA", bio_link: "https://www.bravotv.com/people/dale-mackay", job_title: "Chef/Co-Owner, Grassroots Restaurant Group", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Massimo Piedimonte", city: "Austin, TX", bio_link: "https://www.bravotv.com/people/may-phattanant-thongthong", job_title: "Executive Chef & Co-Partner, MAZE Dining", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Kat Turner", city: "New York, NY", bio_link: "https://www.bravotv.com/people/begona-rodrigo", job_title: "Executive Chef/Owner, La Salita", season_id: season.id, created_at: Time.current, updated_at: Time.current },
  { name: "Shuai Wang", city: "Houston, TX", bio_link: "https://www.bravotv.com/people/gabriel-rodriguez", job_title: "Private Chef", season_id: season.id, created_at: Time.current, updated_at: Time.current },
]

chefs_2025.each do |chef|
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
  survival_pts: 0.5
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
  { name: "Stephen", email: "stephen.weil@gmail.com", is_admin: true, chefs: [["Massimo Piedimonte", 6], ["Lana Lagomarsini", 8]] },
  { name: "Ovais", email: "ovaisinamullah@gmail.com", is_admin: false, chefs: [["Henry Lu", 4], ["Corwin Hemming", 11]] },
  { name: "Scott", email: "saherndon@gmail.com", is_admin: false, chefs: [["Vincenzo Loseto", 1], ["Bailey Sullivan", 14]] },
  { name: "Andrea", email: "andreareed2007@gmail.com", is_admin: false, chefs: [["Anya El-wattar", 2], ["Paula Larrea", 13]] },
  { name: "Ben", email: "sccrrckstr@gmail.com", is_admin: false, chefs: [["Cesar Murillo", 5], ["Tristen Epps", 10]] },
  { name: "Jessica", email: "some@email.com", is_admin: false, chefs: [["Zubair Mohajir", 7], ["Katianna Hong", 8]] },
  { name: "Sam", email: "some2@email.com", is_admin: false, chefs: [["Shuai Wang", 3], ["Kat Turner", 12]] }
]

members.each do |member|
  user = User.find_by(email: member[:email])
  user ||= User.create!(member.except(:chefs).merge(password: "packurknives", password_confirmation: "packurknives"))
  league_user = LeagueUser.create!(league: league, user: user, team_name: "#{user.name}'s Team", is_manager: user.name == "Stephen")
  member[:chefs].each do |chef_name, pick_number|
    chef = Chef.find_by(name: chef_name, season: season)
    LeagueUserChef.create!(chef: chef, league_user: league_user, pick_number: pick_number)
  end
end

episodes = [
  { season_id: season.id, week: 2, air_date: "3/20/2025", name: "Brunch a la Boulud" },
  { season_id: season.id, week: 3, air_date: "3/27/2025", name: "Best Served Cold" },
  { season_id: season.id, week: 4, air_date: "4/3/2025", name: "Top Chef Trivia" },
  { season_id: season.id, week: 5, air_date: "4/10/2025", name: "Line Cook for a Day" },
]

episodes.each do |episode|
  Episode.create!(episode)
end