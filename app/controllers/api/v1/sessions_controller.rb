# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      def create
        resource = User.find_for_database_authentication(email: params[:email])
        return validate_email unless resource
        return validate_password unless resource.valid_password?(params[:password])

        sign_in(resource)
        token = Authentication.new(resource).generate_token

        success_sign_in(resource, token)
      end

      def success_sign_in(resource, token)
        render json: { success: true,
                       token: token,
                       user: resource }, status: 200
      end

      def validate_email
        render json: { success: false,
                       error: {
                         message: 'User not persisted!'
                       } }, status: :unprocessable_entity
      end

      def validate_password
        render json: { success: false,
                       error: {
                         message: 'Incorrect password, please try again!'
                       } }, status: :unprocessable_entity
      end
    end
  end
end
