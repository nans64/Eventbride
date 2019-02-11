class User < ApplicationRecord

#  validates :first_name, :email, :last_name presence: true
  validates :email, uniqueness: true
  validates :encrypted_password, length: { minimum: 6 }
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
