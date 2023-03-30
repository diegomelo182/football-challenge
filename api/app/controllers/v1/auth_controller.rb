# frozen_string_literal: true

module V1
  # controller responsible to manage the authorization
  class AuthController < ApplicationController
    skip_before_action :authorized?

    def signin
      email, password = sigin_params.values_at(:email, :password)
      message, status, success, user = UserRepository.authenticate(
        email:, password:
      ).values_at(
        :message, :status, :success, :user
      )

      return render json: { message: }, status: status unless success

      render json: { token: jwt_handler.encode_token(build_token_data(user)) }
    end

    private

    def build_token_data(data)
      {
        user_id: data&.id,
        role: data&.role
      }
    end

    def sigin_params
      params.require(:auth).permit(:email, :password)
    end

    def jwt_handler
      JwtHandler.new(request)
    end
  end
end
