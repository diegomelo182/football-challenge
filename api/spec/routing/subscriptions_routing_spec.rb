require 'rails_helper'

RSpec.describe V1::SubscriptionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/subscriptions').to route_to('v1/subscriptions#index')
    end

    it 'routes to #show' do
      expect(get: '/v1/subscriptions/1').to route_to('v1/subscriptions#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/subscriptions').to route_to('v1/subscriptions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/subscriptions/1').to route_to('v1/subscriptions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/subscriptions/1').to route_to('v1/subscriptions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/subscriptions/1').to route_to('v1/subscriptions#destroy', id: '1')
    end
  end
end
