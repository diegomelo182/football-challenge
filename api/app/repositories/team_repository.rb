# frozen_string_literal: true

# class responsible for manage the team database table queries
class TeamRepository
  class << self
    def find(id)
      Team.find(id)
    end

    def find_by(*attributes)
      Team.find_by(attributes.attributes)
    end

    def filter(params:)
      Team.where(params)
    end

    def create(params:)
      team = Team.new(params)
      team.save
    end

    def update(id:, params:)
      Team.update(id, params)
    end

    def destroy(id:)
      Team.destroy(id)
    end
  end
end
