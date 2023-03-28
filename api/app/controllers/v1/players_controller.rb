# frozen_string_literal: true

module V1
  # player controller
  class PlayersController < ApplicationController
    has_scope :by_age
    has_scope :by_position
    has_scope :by_nationality
    has_scope :page

    # GET /players
    def index
      @players = PlayerRepository.filter(scoped_model: apply_scopes(Player))

      render jsonapi: @players
    end

    # GET /players/1
    def show
      render jsonapi: PlayerRepository.find(params[:id])
    end

    # POST /players
    def create
      @player = PlayerRepository.create(params: player_params)

      return render jsonapi: @player.errors, status: :unprocessable_entity if @player.errors

      render jsonapi: @player, status: :created, location: @player
    end

    # PATCH/PUT /players/1
    def update
      @player = PlayerRepository.update(id: params[:id], params: player_params)

      return render jsonapi: @player.errors, status: :unprocessable_entity if @player.errors

      render jsonapi: @player
    end

    # DELETE /players/1
    def destroy
      PlayerRepository.destroy(id: params[:id])
    end

    private

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :number, :nationality_id, :team_id, :birthdate, :position)
    end
  end
end
