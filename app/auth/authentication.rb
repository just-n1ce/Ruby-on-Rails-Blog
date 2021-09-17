# frozen_string_literal: true

class Authentication
  def initialize(user_object)
    @email = user_object[:email]
    @password = user_object[:password]
    @user = User.find_by(email: @email)
  end

  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
