class JobCategory < ApplicationRecord
  has_many :workers, dependent: :destroy
  paginates_per 15
  belongs_to :user
  validates :name, presence:true
  validates :user_id, presence:true

    def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at", "user_id"]
  end

end
