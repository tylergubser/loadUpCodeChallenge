class Booking < ApplicationRecord
    belongs_to :user
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :animal_name, presence: true
    validates :animal_type, inclusion: { in: ["dog", "cat", "Dog", "Cat"] }, :allow_nil => false
    validates :requested_hours, presence: true, :inclusion =>  2..8
    validates :email, presence: true
end
