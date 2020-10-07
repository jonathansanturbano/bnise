class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!
  def not_found
    render status: 404
  end

  def server_errors
    render status: 500
  end

  def unacceptable
    render status: 422
  end

end
