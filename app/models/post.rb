class Post < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user
  has_many :post_reads

  after_create :send_mails

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment :picture,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

 def receivers
 	group.users.count || 0
 end

 def opens
 	post_reads.count
 end

 def open_rate
 	((opens.to_f / receivers.to_f) * 100).to_i
 end

 def check_post_tracking(user)
 	unless post_reads.where(user: user).present?
 		PostRead.create(post_id: self.id, user_id: user.id)
 	end
 end

 def send_mails
 	group.users.each do |user|
 		UserMailer.new_post(self, user).deliver_now
 	end
 end

end
