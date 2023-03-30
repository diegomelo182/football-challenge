require 'swagger_helper'

RSpec.describe 'v1/auth', type: :request do
  fixtures :users

  let!(:fixture_user) do
    users(:one)
  end

  path '/v1/auth/signin' do
    post('Signin') do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          auth: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: [auth: %w[email email]]
      }

      response(200, 'successful') do
        let(:auth) { { auth: { email: fixture_user.email, password: 'mypasswordhere' } } }
        run_test! do |response|
          api_response = JSON.parse(response.body)
          expect(api_response).to have_key('token')
        end
      end

      response(401, 'wrong password') do
        let(:auth) { { auth: { email: 'admin@email.com', password: '123' } } }
        run_test! do |response|
          api_response = JSON.parse(response.body)
          expect(api_response['message']).equal?('Invalid password')
        end
      end

      response(404, 'user not found') do
        let(:auth) { { auth: { email: 'email@email.com', password: '123' } } }
        run_test! do |response|
          api_response = JSON.parse(response.body)
          expect(api_response['message']).equal?('User not Found')
        end
      end
    end
  end
end
