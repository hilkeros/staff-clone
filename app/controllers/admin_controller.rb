class AdminController < ApplicationController
	before_action :authenticate_user!
  before_action :is_admin?

  def is_admin?
  	unless user_signed_in? && current_user.admin
  		redirect_to root_path, notice: 'Only for admin users'
  	end
  end
end
