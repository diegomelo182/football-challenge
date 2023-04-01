# frozen_string_literal: true

module V1
  # nationalities controller
  class NationalitiesController < ApplicationController
    # GET /nationalities
    def index
      @nationalities = NationalityRepository.filter(scoped_model: Nationality)

      render jsonapi: @nationalities
    end
  end
end
