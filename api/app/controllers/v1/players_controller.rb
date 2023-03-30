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

      render jsonapi: @players, meta: { number_of_pages: number_of_pages(@players.limit(nil).offset(nil).count) }
    end

    # GET /players/1
    def show
      render jsonapi: PlayerRepository.find(params[:id])
    end

    # POST /players
    def create
      @player = PlayerRepository.create(params: player_params)

      return render jsonapi_errors: @player.errors, status: :unprocessable_entity if @player.errors

      render jsonapi: @player, status: :created, location: v1_player_url(@player)
    end

    # PATCH/PUT /players/1
    def update
      @player = PlayerRepository.update(id: params[:id], params: player_params)

      return render jsonapi_errors: @player.errors, status: :unprocessable_entity if @player.errors

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

    def number_of_pages(number_of_items)
      return 1 if number_of_items <= 25
      return (number_of_items / 25) + 1 if (number_of_items.to_f / 25) > (number_of_items / 25).to_i

      (number_of_items / 25).to_i
    end
  end
end
