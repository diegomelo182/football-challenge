# frozen_string_literal: true

module V1
  # nationalities controller
  class NationalitiesController < ApplicationController
    # GET /nationalities
    def index
      @nationalities = Nationality.all

      render jsonapi: @nationalities
    end
  end
end
