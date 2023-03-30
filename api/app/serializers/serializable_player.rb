# frozen_string_literal: true

# class responsible to serialize the user model records
class SerializablePlayer < JSONAPI::Serializable::Resource
  type 'players'

  attributes :name, :number, :birthdate, :position

  belongs_to :nationality
  belongs_to :team

  attribute :nationality_country do
    @object&.nationality&.name
  rescue StandardError
    'Unknown'
  end

  attribute :team_name do
    @object&.team&.name
  rescue StandardError
    'Agent free'
  end

  attribute :age do
    ((Date.today - @object.birthdate) / 365.25).to_i
  end
end
