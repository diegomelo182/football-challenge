# frozen_string_literal: true

# class responsible for manage the player database table queries
class PlayerRepository
  class << self
    def find(id)
      Player.find(id)
    end

    def find_by(*attributes)
      Player.find_by(attributes.first)
    end

    def filter(params:)
      Player.where(params)
    end

    def create(params:)
      player = Player.new(params)
      player.save
    end

    def update(id:, params:)
      Player.update(id, params)
    end

    def destroy(id:)
      Player.destroy(id)
    end
  end
end
