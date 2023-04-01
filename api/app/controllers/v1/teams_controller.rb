# frozen_string_literal: true

module V1
  # teams controller
  class TeamsController < ApplicationController
    before_action :set_team, only: %i[show update destroy]

    # GET /teams
    def index
      @teams = TeamRepository.filter(params: team_filter_params)

      render jsonapi: @teams
    end

    # GET /teams/1
    def show
      render jsonapi: @team
    end

    # POST /teams
    def create
      @teams = TeamRepository.create(params: team_params)

      render jsonapi_errors: @team.errors, status: :unprocessable_entity if @team.errors

      render jsonapi: @team, status: :created, location: v1_team_url(@team)
    end

    # POST /teams/create_bulk
    def create_bulk
      CreateTeamsBulkJob.perform_async(team_bulk_params.to_json)

      render json: { message: 'The job was enqueued successfully' }
    end

    # PATCH/PUT /teams/1
    def update
      @team = TeamRepository.update(id: @team.id, params: team_params)

      render jsonapi_errors: @team.errors, status: :unprocessable_entity if @team.errors

      render jsonapi: @team
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

    def team_bulk_params
      params.require(:data).permit(teams: [
                                     :name, :acronym, { players: %i[
                                       name number nationality birthdate position
                                     ] }
                                   ])
    end

    def team_filter_params
      params.permit(:page, :number_of_items)
    end
  end
end
