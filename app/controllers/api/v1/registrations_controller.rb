# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      def create
        build_resource(register_params)
        unless resource.save
          return render json: { success: false,
                                error: { message: resource.errors.full_messages.join(', ').to_s } },
                        status: :unprocessable_entity
        end
        success_register
      end

      def success_register
        render json: { success: true,
                       message: 'You are registered!',
                       token: Authentication.new(register_params).generate_token,
                       user: resource }, status: 200
      end

      private

      def register_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
