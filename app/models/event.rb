class Event < ApplicationRecord


  belongs_to :user
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances

  has_many :attendances, dependent: :delete_all
  has_many :users, through: :attendances

  validates :start_date,
            presence: true
  validate :start_date_cannot_be_in_the_past

  validates :duration,
            presence: true
  validate :duration_must_be_a_multiply_of_five

  validates :title,
            presence: true,
            length: { in: 5..140 }
  validates :description,
            presence: true,
            length: { in: 20..1000 }
  validates :price,
            presence: true,
            numericality: { greater_than: 0, less_than: 1001 }

  validates :location,
            presence: true

  def duration_must_be_a_multiply_of_five
    if duration.present? && duration%5 != 0
      errors.add(:duration, "duration must be a multiply of five")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end
