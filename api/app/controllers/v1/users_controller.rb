# frozen_string_literal: true

module V1
  # user controller
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]

    # GET /users
    def index
      @users = User.all

      render jsonapi: @users
    end

    # GET /users/1
    def show
      render jsonapi: @user
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        render jsonapi: @user, status: :created, location: @user
      else
        render jsonapi: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render jsonapi: @user
      else
        render jsonapi: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :type)
    end
  end
end
