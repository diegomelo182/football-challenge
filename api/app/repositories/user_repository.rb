# frozen_string_literal: true

# class responsible for manage the user database table queries
class UserRepository
  class << self
    def authenticate(email:, password:)
      user = User.find_by(email:)
      return { success: false, message: 'User not Found', status: :not_found } unless user
      return { success: false, message: 'Invalid password', status: :unauthorized } unless user.authenticate(password)

      { success: true, user: }
    end

    def find(id)
      User.find(id)
    end

    def find_by(*attributes)
      User.find_by(attributes.attributes)
    end

    def filter(params:)
      User.where(params)
    end

    def create(params:)
      team = User.new(params)
      team.save
    end

    def update(id:, params:)
      User.update(id, params)
    end

    def destroy(id:)
      User.destroy(id)
    end
  end
end
