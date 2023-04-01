# frozen_string_literal: true

# class responsible to handle the logic behind the team bulk creation
class TeamBulkHandler
  def initialize(data)
    @data = data
  end

  def call
    ActiveRecord::Base.transaction do
      @data['teams'].each do |team|
        mapped_team = team_mapper(team)
        new_team = Team.new mapped_team.except('players')
        if new_team.valid?
          new_team.save!
        else
          puts 'Invalid team'
          puts mapped_team.inspect
        end
      end
    end
  end

  private

  def team_mapper(team)
    team['players'].map do |player|
      player['nationality'] = Nationality.first_or_create name: player['nationality']
      player
    end
    team['players_attributes'] = team['players']

    team
  end
end
