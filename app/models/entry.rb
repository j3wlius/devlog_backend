class Entry < ApplicationRecord
  belongs_to :user
  validates :mood, presence: true, inclusion: { in: %w[great excited good okay rough] }
  validates :date
end
