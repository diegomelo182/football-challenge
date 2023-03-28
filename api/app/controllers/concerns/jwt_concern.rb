# frozen_string_literal: true

# responsible to handle the data of the jwt
module JwtConcern
  extend ActiveSupport::Concern

  included do
    before_action :authorized?

    def authorized?
      return if current_user

      render json: {
               error: true,
               message: 'Invalid token, please make sure that you have sent it properly via Authorization Header'
             },
             status: :unauthorized
    end

    def current_user
      jwt_handler.current_user
    end

    def admin?
      current_user.admin?
    end

    def user?
      current_user.user?
    end

    private

    def jwt_handler
      JwtHandler.new(request)
    end
  end
end
