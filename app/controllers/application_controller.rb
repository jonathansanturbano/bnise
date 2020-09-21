class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_basket

  private

  def set_basket
    return if !user_signed_in?
    @basket = Basket.find_by(user_id: current_user.id, state: "pending") || Basket.create(user_id: current_user.id, state: "pending")
  end
end
