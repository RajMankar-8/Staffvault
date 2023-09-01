class Organization < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  validates :name, :about, presence:true 
end
