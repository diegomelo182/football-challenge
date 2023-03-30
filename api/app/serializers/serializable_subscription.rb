# frozen_string_literal: true

# class responsible to serialize the user model records
class SerializableSubscription < JSONAPI::Serializable::Resource
  type 'subscriptions'

  belongs_to :user
  belongs_to :player
end
