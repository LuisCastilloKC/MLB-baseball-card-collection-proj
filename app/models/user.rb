class User < ApplicationRecord
    has_secure_password
    has_many :cards
    has_many :comments
    has_many :commented_cards, through: :comments, source: :card
    #has_many :descriptions, through: :cards

     validates :username, :email, presence: true
end
