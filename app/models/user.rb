class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    has_secure_password
    validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
    validates :last_name, presence: true, length: { minimum: 3, maximum: 20 }
    validates_presence_of :password_digest
    validates :email, presence: true, length: { minimum: 3, maximum: 20 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
end
