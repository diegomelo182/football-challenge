require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe 'GET show' do
    before(:each) do
      expect_any_instance_of(ApplicationController).to receive(:authorized?).and_return(nil)
    end

    it 'returns a successful response' do
      get :show, params: { id: 1 }

      expect(response).to be_successful
    end
  end
end
