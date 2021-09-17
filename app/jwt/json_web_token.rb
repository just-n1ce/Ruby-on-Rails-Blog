# frozen_string_literal: true

class JsonWebToken
  JWT_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, token_expired_at = 7.days.from_now)
    payload[:token_expired_at] = token_expired_at
    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    body, _header = JWT.decode(token, JWT_SECRET)
    HashWithIndifferentAccess.new body
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  rescue JWT::DecodeError, JWT::VerificationError => e
    raise ExceptionHandler::DecodeError, e.message
  end
end
