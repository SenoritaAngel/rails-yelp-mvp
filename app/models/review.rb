class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rate, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
