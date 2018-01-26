class Post < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment :picture,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
