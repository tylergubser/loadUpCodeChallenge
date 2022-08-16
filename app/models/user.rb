class User < ApplicationRecord
    has_secure_password
    has_many :bookings, dependent: :destroy
    validates :password, presence: true, :confirmation => true, :length => {:within => 6..40}
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
end
