namespace :db do
  desc "Fill database with NFL schedule data"
  task populate_full_schedule: :environment do
    @teams = Team.all
    teams_hash = {}

    for team in @teams
      teams_hash[team.nickname] = team.id 
    end

    require 'csv'

    Schedule.delete_all

    CSV.foreach("./app/assets/import/nfl-2013-schedule.csv", :headers => true) do |row|

      @week = row[0].split(" ").last

      @date = DateTime.parse("#{row[3]}" + " " + "#{row[4]}").to_s(:db)
      @away_team = row[1].split(" ").first
      @home_team = row[2].split(" ").first

      Schedule.create!(week: @week,
                      datetime: @date,
                      away_team_id: teams_hash[@away_team],
                      home_team_id: teams_hash[@home_team])
    end
  end
end