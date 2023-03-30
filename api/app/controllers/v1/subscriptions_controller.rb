# frozen_string_literal: true

module V1
  # subscriptions controller
  class SubscriptionsController < ApplicationController
    before_action :set_subscription, only: %i[show update destroy]

    # GET /subscriptions
    def index
      @subscriptions = Subscription.all

      render jsonapi: @subscriptions
    end

    # GET /subscriptions/1
    def show
      render jsonapi: @subscription
    end

    # POST /subscriptions
    def create
      @subscription = Subscription.new(subscription_params)

      if @subscription.save
        render jsonapi: @subscription, status: :created, location: v1_subscription_url(@subscription)
      else
        render jsonapi_errors: @subscription.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /subscriptions/1
    def update
      if @subscription.update(subscription_params)
        render jsonapi: @subscription
      else
        render jsonapi_errors: @subscription.errors, status: :unprocessable_entity
      end
    end

    # DELETE /subscriptions/1
    def destroy
      @subscription.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:player_id, :user_id)
    end
  end
end
