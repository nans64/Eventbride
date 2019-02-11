class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :stripe_customer_id, uniqueness: true

  after_create :admin_send

  def admin_send
    UserMailer.admin_send(self).deliver_now
  end
end
