class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  def user_name
    if user
      user.user_name
    else
      "Anonymous"
    end
  end
end
