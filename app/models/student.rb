class Student < ApplicationRecord
  
  before_save { self.email=email.downcase }
  validates :name, presence: true,length:{minimum:5,maximum:50} 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: { maximum: 105 },
            format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  has_many :student_courses
  has_many :courses, through: :student_courses

  before_create :generate_confirmation_token

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s
  end

  after_create :send_confirmation_email

  def send_confirmation_email
    puts 'Send confirmation email'
    UserMailer.confirmation_email(self).deliver_later
  end

end