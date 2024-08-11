class Worker < ApplicationRecord
	paginates_per 15
  belongs_to :job_category
  belongs_to :user
	has_many :personals, dependent: :destroy


	validates :first_name, :last_name, presence:true
	validates :address_line1, :state, :country, :city, :pincode, presence:true
	validates :email, presence:true
	validates :date_of_birth, :job_category_id, :user_id, presence:true

  validate :age_criteria

  def age_criteria
    if date_of_birth.present? && date_of_birth.to_date > 21.years.ago
      errors.add(:date_of_birth, "Must be greater than 21")
    end
  end

   JOB_TITTlE = ['Software Engineer', 'Data Scientist', 'Network Administrator', 'Web Developer',
                 'IT Project Manager', 'Systems Analyst', 'Database Administrator','Cybersecurity Analyst',
                 'UI/UX Designer', 'DevOps Engineer', 'Cloud Solutions Architect', 'Quality Assurance Tester',
                 ' IT Support Specialist', 'Business Analyst', 'Machine Learning Engineer' ]

  def self.ransackable_attributes(auth_object = nil)
    ["about", "address_line1", "bio", "city", "country", "created_at", "date_of_birth", "email", "first_name", "id", "job_category_id", "job_title", "last_name", "pincode", "state", "updated_at", "user_id"]
  end 

  
  def self.ransackable_associations(auth_object = nil)
    ["job_category", "personals", "user"]
  end
               
	def name
		"#{first_name}  #{last_name}".strip
	end

	def name_with_email
		"#{name} (#{email})"
	end
end



