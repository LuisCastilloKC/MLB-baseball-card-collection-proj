class User < ApplicationRecord
    has_secure_password
    has_many :cards
    has_many :comments
    has_many :commented_cards, through: :comments, source: :card
    
    validates :password, length: { in: 6..12 }
    validates :username, presence: { message: 'Please enter your username.' }, uniqueness: { message: 'try a different username.' }
     validates :email, presence: true

end
