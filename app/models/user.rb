class User < ActiveRecord::Base
  has_secure_password
	validates :email, presence: {message: "must be present"},
	                  uniqueness: true,
									  format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  has_many :ideas, dependent: :nullify
  has_many :comments, dependent: :nullify
	def user_name
		"#{first_name} #{last_name}"
	end
end
