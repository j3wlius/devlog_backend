class Entry < ApplicationRecord
  belongs_to :user
  validates :mood, presence: true, inclusion: { in: %w[great excited good okay rough] }
  validates :date, presence: true
  validates :work_done, presence: true
end
