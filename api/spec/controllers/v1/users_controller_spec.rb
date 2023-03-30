require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe 'GET show' do
    let!(:user) do
      User.where(email: 'admin@email.com').first_or_create(name: 'Admin', email: 'admin@email.com',
                                                           password: 'MyAdmin@password123', role: :admin)
    end

    before(:each) do
      expect_any_instance_of(ApplicationController).to receive(:authorized?).and_return(nil)
    end

    it 'returns a successful response' do
      get :show, params: { id: user.id }

      expect(response).to be_successful
    end
  end
end
