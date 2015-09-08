class User < ActiveRecord::Base
  has_secure_password
	validates :email, presence: {message: "must be present"},
	                  uniqueness: true,
									  format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  has_many :ideas, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :members, dependent: :destroy
  has_many :joined_ideas, through: :members, source: :idea

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  def joined_ideas?(idea)
    joined_ideas.include?(idea)
  end
  def liked_ideas?(idea)
    liked_ideas.include?(idea)
  end
	def user_name
		"#{first_name} #{last_name}"
	end
end
