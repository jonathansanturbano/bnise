class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def welcome
  end

  def about
  end

  def legal
  end

  def sales_conditions
  end

  def privacy_policy
  end
end
