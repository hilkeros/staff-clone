class UserMailer < ApplicationMailer

	def new_post(post, user)
		@user = user
		@post = post
		mail(to: @user.email, subject: "News: #{@post.title}")
	end
end
