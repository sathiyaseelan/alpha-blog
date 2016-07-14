class User < ActiveRecord::Base
  has_secure_password
  has_many :articles, dependent: :destroy
  validates :username, presence: true,
        uniqueness: {case_sensitive: false},
        length: { minimum: 3 , maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
        uniqueness: {case_sensitive: false},
        format: { with: VALID_EMAIL_REGEX}

  def full_name
    first_name || last_name ?  "#{first_name} #{last_name}".strip : "#{username}"
  end

  def self.find_by_param(param)
    User.find_by(email: param) || User.find_by(username: param)
  end
end
