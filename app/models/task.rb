class Task < ApplicationRecord
    validates :status, presence: true, length: { maximum: 10 }
    belongs_to :user
end
