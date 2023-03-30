# frozen_string_literal: true

# class responsible to serialize the user model records
class SerializableNotification < JSONAPI::Serializable::Resource
  type 'notifications'

  attributes :message

  belongs_to :user
end
