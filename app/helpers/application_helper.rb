module ApplicationHelper

	def current_user?(user)
		current_user.present? && current_user == user
	end

end
