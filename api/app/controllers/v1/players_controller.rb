# frozen_string_literal: true

module V1
  # player controller
  class PlayersController < ApplicationController
    # GET /players
    def index
      @players = PlayerRepository.filter(params: player_filter_params)

      render json: @players
    end

    # GET /players/1
    def show
      render json: PlayerRepository.find(params[:id])
    end

    # POST /players
    def create
      @player = PlayerRepository.create(params: player_params)

      return render json: @player.errors, status: :unprocessable_entity if @player.errors

      render json: @player, status: :created, location: @player
    end

    # PATCH/PUT /players/1
    def update
      @player = PlayerRepository.update(id: params[:id], params: player_params)

      return render json: @player.errors, status: :unprocessable_entity if @player.errors

      render json: @player
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

    def player_filter_params
      params.permit(:page, :number_of_items)
    end
  end
end
