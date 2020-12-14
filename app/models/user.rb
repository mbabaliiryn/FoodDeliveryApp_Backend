class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    has_secure_password
    validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
    validates :last_name, presence: true, length: { minimum: 3, maximum: 20 }
    validates_presence_of :password_digest
    validates :email, presence: true
    # validates :email, presence: true, length: { minimum: 3, maximum: 20 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    belongs_to :entity , polymorphic:true
    has_one :address
  
    def get_delivering_restaurants
      result = []
      restaurants = Restaurant.all
      restaurants.each do |restaurant|
        distance = self.address.distance_from(restaurant.address)
        if restaurant.delivery_range && distance <= restaurant.delivery_range
          result << restaurant.address
        end
      end
      result
    end
end
