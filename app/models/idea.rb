class Idea < ActiveRecord::Base
  belongs_to :user

  def user_name
    if user
      user.user_name
    else
      "Anonymous"
    end
  end
end
