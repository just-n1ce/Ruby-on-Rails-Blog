# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate, only: %i[create destroy]

    private

    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        @user = User.find_by(token: token)
        @user || respond_with_unauthorized('You must log in!')
      end
    end

    def respond_with_output(output)
      if output[:success]
        render json: { result: output[:result] }, status: 200
      else
        render json: { error: { message: output[:errors].to_s } }, status: :unprocessable_entity
      end
    end

    def respond_with_unauthorized(error)
      render json: { error: { message: error } }, status: :unauthorized
    end
  end
end
