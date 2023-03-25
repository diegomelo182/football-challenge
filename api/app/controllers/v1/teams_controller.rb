# frozen_string_literal: true

module V1
  # teams controller
  class TeamsController < ApplicationController
    before_action :set_team, only: %i[show update destroy]

    # GET /teams
    def index
      @teams = TeamRepository.filter(params: team_filter_params)

      render json: @teams
    end

    # GET /teams/1
    def show
      render json: @team
    end

    # POST /teams
    def create
      if TeamRepository.create(params: team_params)
        render json: @team, status: :created, location: @team
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /teams/1
    def update
      if TeamRepository.update(id: @team.id, params: team_params)
        render json: @team
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end

    # DELETE /teams/1
    def destroy
      TeamRepository.destroy(@team)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = TeamRepository.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :acronym)
    end

    def team_filter_params
      params.permit(:page, :number_of_items)
    end
  end
end
