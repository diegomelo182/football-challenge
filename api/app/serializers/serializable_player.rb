# frozen_string_literal: true

# class responsible to serialize the user model records
class SerializablePlayer < JSONAPI::Serializable::Resource
  type 'players'

  attributes :name, :number, :birthdate, :position

  belongs_to :nationality
  belongs_to :team
end
