class Card < ApplicationRecord
  belongs_to :user
  belongs_to :description
  has_many :comments
  has_many :users, through: :comments
end
