class User < ApplicationRecord
    has_secure_password
    has_many :cards
    has_many :comments
    has_many :descriptions, through: :cards

end
