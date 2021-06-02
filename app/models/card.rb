class Card < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments
  has_one_attached :image, :dependent => :destroy

  validates :player_name, :team_name, :year, presence: true
  scope :alpha, -> { order(:year)}

end
