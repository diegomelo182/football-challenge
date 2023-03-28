require 'rails_helper'

RSpec.describe V1::PlayersController, type: :controller do
  describe 'GET index' do
    before(:each) do
      expect_any_instance_of(ApplicationController).to receive(:authorized?).and_return(nil)
    end

    it 'returns a successful response' do
      get :index

      expect(response).to be_successful
    end
  end
end
