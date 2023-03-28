# frozen_string_literal: true

# base class responsible for  to be a model role of the all other controllers
class ApplicationController < ActionController::API
  include JwtConcern

  def not_found
    render json: { message: 'route not found' }, status: :not_found
  end
end
