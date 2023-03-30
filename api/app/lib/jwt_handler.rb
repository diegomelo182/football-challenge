# frozen_string_literal: true

# class responsible to handle the logic behind the jwt token
class JwtHandler
  def initialize(request)
    @request = request
  end

  def encode_token(payload)
    JWT.encode(payload, secret)
  end

  def decoded_token
    header = @request.headers['Authorization']
    return unless header

    token = header.split(' ')[1]
    begin
      JWT.decode(token, secret)
    rescue JWT::DecodeError
      nil
    end
  end

  def secret
    ENV['JWT_SECRET_KEY']
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @current_user ||= fetch_user_id(user_id)
  end

  private

  def fetch_user_id(id)
    User.find_by(id:)
  end
end
