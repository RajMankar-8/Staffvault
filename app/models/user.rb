class User < ApplicationRecord
 has_one :organization, dependent: :destroy
 has_many :job_categorys, dependent: :destroy
 has_many :workers, dependent: :destroy
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
end
