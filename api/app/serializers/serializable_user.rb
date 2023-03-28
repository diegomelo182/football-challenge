# frozen_string_literal: true

# class responsible to serialize the user model records
class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :name, :email, :created_at
end
