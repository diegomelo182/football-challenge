# frozen_string_literal: true

# class responsible to serialize the user model records
class SerializableNationality < JSONAPI::Serializable::Resource
  type 'nationalities'

  attributes :name
end
