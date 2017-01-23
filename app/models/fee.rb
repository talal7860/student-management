# Fee Model
class Fee < ApplicationRecord
  enum pay_status: [:paid, :not_paid]
  belongs_to :student

  validates_presence_of :student_id
  validates_presence_of :amount
  validates_presence_of :pay_date
  validates_presence_of :pay_status
end
