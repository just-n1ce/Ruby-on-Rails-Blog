# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ExceptionHandler
  respond_to :json
end
