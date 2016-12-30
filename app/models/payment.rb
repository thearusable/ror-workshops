class Payment < ActiveRecord::Base
  MONTHS = %w(January February March April May June July August September October November December)
  belongs_to :student

  validates :student_id, presence: true
  validates :month, inclusion: { in: MONTHS }, presence: true
  validates :date_of_payment, presence: true, if: :amount?
end
