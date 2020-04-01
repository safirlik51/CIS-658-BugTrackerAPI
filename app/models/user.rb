class User < ApplicationRecord
	has_many :bugs

	
	validates :lname, :fname, :email, presence: { message: "Field must not be blank" }
	validates :email, uniqueness: {case_sensitive: false}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Not a valid email address"}
	validates :thumbnail, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG, or PNG image.'}
end
