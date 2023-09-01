class Personal < ApplicationRecord

  DOC_TYPES = ['Marksheet','Photo ID', 'Address proof','Personal ID','Others'].freeze 

  belongs_to :worker

  has_one_attached :image
  validates :name, :doc_type, :worker_id, :image, presence: true
end
