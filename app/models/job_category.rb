class JobCategory < ApplicationRecord
  belongs_to :user
  has_many :workers

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at", "user_id"]
  end

end
