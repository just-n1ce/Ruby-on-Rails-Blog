# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::BaseController
      def show
        respond_with_output(success: true, result: User.find_by_id(params[:id]))
      end
    end
  end
end
