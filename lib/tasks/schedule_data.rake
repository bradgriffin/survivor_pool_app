namespace :db do
  desc "Fill database with NFL schedule data"
  task populate_schedule: :environment do
  	@teams = Team.all
  	teams_hash = {}

  	for team in @teams
  		teams_hash[team.nickname] = team.id 
  	end

  	Schedule.create!(week: 1,
  					 datetime: "2013-09-05 20:30:00",
  					 away_team_id: teams_hash["Ravens"],
  					 home_team_id: teams_hash["Broncos"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Patriots"],
  					 home_team_id: teams_hash["Bills"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Seahawks"],
  					 home_team_id: teams_hash["Panthers"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Bengals"],
  					 home_team_id: teams_hash["Bears"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Dolphins"],
  					 home_team_id: teams_hash["Browns"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Vikings"],
  					 home_team_id: teams_hash["Lions"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Raiders"],
  					 home_team_id: teams_hash["Colts"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Chiefs"],
  					 home_team_id: teams_hash["Jaguars"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Falcons"],
  					 home_team_id: teams_hash["Saints"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 13:00:00",
  					 away_team_id: teams_hash["Buccaneers"],
  					 home_team_id: teams_hash["Jets"])
    Schedule.create!(week: 1,
             datetime: "2013-09-08 13:00:00",
             away_team_id: teams_hash["Titans"],
             home_team_id: teams_hash["Steelers"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 16:25:00",
  					 away_team_id: teams_hash["Cardinals"],
  					 home_team_id: teams_hash["Rams"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 16:25:00",
  					 away_team_id: teams_hash["Packers"],
  					 home_team_id: teams_hash["49ers"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-08 20:30:00",
  					 away_team_id: teams_hash["Giants"],
  					 home_team_id: teams_hash["Cowboys"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-09 19:10:00",
  					 away_team_id: teams_hash["Eagles"],
  					 home_team_id: teams_hash["Redskins"])
  	Schedule.create!(week: 1,
  					 datetime: "2013-09-09 22:20:00",
  					 away_team_id: teams_hash["Texans"],
  					 home_team_id: teams_hash["Chargers"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-12 20:25:00",
  					 away_team_id: teams_hash["Jets"],
  					 home_team_id: teams_hash["Patriots"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Rams"],
  					 home_team_id: teams_hash["Falcons"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Browns"],
  					 home_team_id: teams_hash["Ravens"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Panthers"],
  					 home_team_id: teams_hash["BIlls"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Vikings"],
  					 home_team_id: teams_hash["Bears"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Redskins"],
  					 home_team_id: teams_hash["Packers"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Titans"],
  					 home_team_id: teams_hash["Texans"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Dolphins"],
  					 home_team_id: teams_hash["Colts"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Cowboys"],
  					 home_team_id: teams_hash["Chiefs"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 13:00:00",
  					 away_team_id: teams_hash["Chargers"],
  					 home_team_id: teams_hash["Eagles"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 16:05:00",
  					 away_team_id: teams_hash["Lions"],
  					 home_team_id: teams_hash["Cardinals"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 16:05:00",
  					 away_team_id: teams_hash["Saints"],
  					 home_team_id: teams_hash["Buccaneers"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 16:25:00",
  					 away_team_id: teams_hash["Broncos"],
  					 home_team_id: teams_hash["Giants"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 16:25:00",
  					 away_team_id: teams_hash["Jaguars"],
  					 home_team_id: teams_hash["Raiders"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-15 20:30:00",
  					 away_team_id: teams_hash["49ers"],
  					 home_team_id: teams_hash["Seahawks"])
  	Schedule.create!(week: 2,
  					 datetime: "2013-09-16 20:40:00",
  					 away_team_id: teams_hash["Steelers"],
  					 home_team_id: teams_hash["Bengals"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-20 20:20:00",
  					 away_team_id: teams_hash["Giants"],
  					 home_team_id: teams_hash["Panthers"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Buccaneers"],
  					 home_team_id: teams_hash["Cowboys"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Jaguars"],
  					 home_team_id: teams_hash["Colts"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Bills"],
  					 home_team_id: teams_hash["Browns"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Jets"],
  					 home_team_id: teams_hash["Dolphins"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Chiefs"],
  					 home_team_id: teams_hash["Saints"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Bengals"],
  					 home_team_id: teams_hash["Redskins"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Rams"],
  					 home_team_id: teams_hash["Bears"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["49ers"],
  					 home_team_id: teams_hash["Vikings"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 13:00:00",
  					 away_team_id: teams_hash["Lions"],
  					 home_team_id: teams_hash["Titans"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 16:05:00",
  					 away_team_id: teams_hash["Falcons"],
  					 home_team_id: teams_hash["Chargers"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 16:05:00",
  					 away_team_id: teams_hash["Eagles"],
  					 home_team_id: teams_hash["Cardinals"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 16:25:00",
  					 away_team_id: teams_hash["Steelers"],
  					 home_team_id: teams_hash["Raiders"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 16:25:00",
  					 away_team_id: teams_hash["Texans"],
  					 home_team_id: teams_hash["Broncos"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-23 20:20:00",
  					 away_team_id: teams_hash["Patriots"],
  					 home_team_id: teams_hash["Ravens"])
  	Schedule.create!(week: 3,
  					 datetime: "2012-09-24 20:30:00",
  					 away_team_id: teams_hash["Packers"],
  					 home_team_id: teams_hash["Seahawks"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-27 20:20:00",
  					 away_team_id: teams_hash["Browns"],
  					 home_team_id: teams_hash["Ravens"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 13:00:00",
  					 away_team_id: teams_hash["Patriots"],
  					 home_team_id: teams_hash["Bills"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 13:00:00",
  					 away_team_id: teams_hash["49ers"],
  					 home_team_id: teams_hash["Jets"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 13:00:00",
  					 away_team_id: teams_hash["Seahawks"],
  					 home_team_id: teams_hash["Rams"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 13:00:00",
  					 away_team_id: teams_hash["Panthers"],
  					 home_team_id: teams_hash["Falcons"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 13:00:00",
  					 away_team_id: teams_hash["Vikings"],
  					 home_team_id: teams_hash["Lions"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 13:00:00",
  					 away_team_id: teams_hash["Chargers"],
  					 home_team_id: teams_hash["Chiefs"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 13:00:00",
  					 away_team_id: teams_hash["Titans"],
  					 home_team_id: teams_hash["Texans"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 16:05:00",
  					 away_team_id: teams_hash["Bengals"],
  					 home_team_id: teams_hash["Jaguars"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 16:05:00",
  					 away_team_id: teams_hash["Raiders"],
  					 home_team_id: teams_hash["Broncos"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 16:05:00",
  					 away_team_id: teams_hash["Dolphins"],
  					 home_team_id: teams_hash["Cardinals"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 16:25:00",
  					 away_team_id: teams_hash["Redskins"],
  					 home_team_id: teams_hash["Buccaneers"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 16:25:00",
  					 away_team_id: teams_hash["Saints"],
  					 home_team_id: teams_hash["Packers"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-09-30 20:20:00",
  					 away_team_id: teams_hash["Giants"],
  					 home_team_id: teams_hash["Eagles"])
  	Schedule.create!(week: 4,
  					 datetime: "2012-10-01 20:30:00",
  					 away_team_id: teams_hash["Bears"],
  					 home_team_id: teams_hash["Cowboys"])
  end
end