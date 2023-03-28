# frozen_string_literal: true

module V1
  # controller responsible to manage the authorization
  class AuthController < ApplicationController
    skip_before_action :authorized?

    def signin
      auth_data = UserRepository.authenticate(email: sigin_params[:email], password: sigin_params[:password])

      return render json: { message: auth_data[:message] }, status: auth_data[:status] unless auth_data[:success]

      render json: { token: jwt_handler.encode_token(build_token_data(auth_data[:user])) }
    end

    private

    def build_token_data(data)
      {
        user_id: data.id
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
