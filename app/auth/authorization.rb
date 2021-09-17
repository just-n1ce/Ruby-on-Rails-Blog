# frozen_string_literal: true

class Authorization
  attr_reader :token

  def initialize(request)
    @token = request
  end

  def validate
    'You do not have account! Please, sign up!' unless token
  end

  def call
    ::User.find(JsonWebToken.decode(token)[:user_id]) if token
  end
end
