# frozen_string_literal: true

module V1
  # notification controller
  class NotificationsController < ApplicationController
    before_action :set_notification, only: %i[show update destroy]

    # GET /notifications
    def index
      @notifications = Notification.all

      render jsonapi: @notifications
    end

    # GET /notifications/1
    def show
      render jsonapi: @notification
    end

    # POST /notifications
    def create
      @notification = Notification.new(notification_params)

      if @notification.save
        render jsonapi: @notification, status: :created, location: @notification
      else
        render jsonapi: @notification.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /notifications/1
    def update
      if @notification.update(notification_params)
        render jsonapi: @notification
      else
        render jsonapi: @notification.errors, status: :unprocessable_entity
      end
    end

    # DELETE /notifications/1
    def destroy
      @notification.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:player_id, :message)
    end
  end
end
