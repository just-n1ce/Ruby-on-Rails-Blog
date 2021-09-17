# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < Api::BaseController
      def show
        respond_with_output(success: true, result: Category.find_by_id(params[:id]))
      end
    end
  end
end
