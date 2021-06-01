class Card < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments
  has_one_attached :image, :dependent => :destroy
end
