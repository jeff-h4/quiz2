class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :members, dependent: :destroy
  has_many :users, through: :members

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_attached_file :ideapic, styles: { medium: "300x300>", thumb: "100x100>" }, 
      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :ideapic, 
    content_type: /\Aimage\/.*\Z/

  def user_name
    if user
      user.user_name
    else
      "Anonymous"
    end
  end
  def joined_for(user)
    members.find_by_user_id(user.id)
  end
  def liked_for(user)
    likes.find_by_user_id(user.id)
  end
end
