require 'swagger_helper'
# require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/v1/notifications', type: :request do
  fixtures :players, :notifications

  let!(:player) do
    players(:one)
  end

  let!(:notification) do
    notifications(:one)
  end

  before(:each) do
    expect_any_instance_of(ApplicationController).to receive(:authorized?).and_return(nil)
  end

  path '/v1/notifications' do
    post('Create notifications') do
      tags 'Notifications'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :notification, in: :body, schema: {
        type: :object,
        properties: {
          notification: {
            type: :object,
            properties: {
              player_id: { type: :integer },
              message: { type: :string }
            }
          }
        },
        required: [notification: %w[player_id message]]
      }
      response(201, 'successful') do
        let(:notification) { { notification: { player_id: player.id, message: 'One message here' } } }
        run_test!
      end

      # response(401, 'wrong password') do
      #   let(:notification) { { notification: { player_id: 'admin@email.com', message: 'One message here' '123' } } }
      #   run_test!
      # end

      # response(404, 'user not found') do
      #   let(:notification) { { notification: { player_id: 'email@email.com', message: 'One message here' '123' } } }
      #   run_test!
      # end
    end

    get('List notifications') do
      tags 'Notifications'
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/v1/notifications/{id}' do
    put('Update Notifications') do
      tags 'Notifications'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      parameter name: :notification, in: :body, schema: {
        type: :object,
        properties: {
          notification: {
            type: :object,
            properties: {
              player_id: { type: :integer },
              message: { type: :string }
            }
          }
        },
        required: [notification: %w[player_id message]]
      }
      response(200, 'successful') do
        db_notification = Notification.limit(1).first
        let(:id) { db_notification.id }
        let(:notification) { { notification: { player_id: player.id, message: 'One message here' } } }
        run_test!
      end
    end

    get('Show specific notification') do
      tags 'Notifications'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response(200, 'successful') do
        let(:id) { notification.id }
        run_test!
      end
    end

    delete('Delete specific notification') do
      tags 'Notifications'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response(204, 'successful') do
        let(:id) { notification.id }
        run_test!
      end
    end
  end
end
