class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :members, dependent: :destroy
  has_many :users, through: :members

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
end
