# frozen_string_literal: true

# class responsible to serialize the user model records
class SerializableTeam < JSONAPI::Serializable::Resource
  type 'teams'

  attributes :name, :acronym

  has_many :players
end
