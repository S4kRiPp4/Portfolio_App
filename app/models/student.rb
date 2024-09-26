class Student < ApplicationRecord
  has_one_attached :profile_picture
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :school_email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@msudenver\.edu\z/, message: "must be a valid MSU email" } # Add format validation
  validates :major, presence: true
  validates :graduation_date, presence: true
end
