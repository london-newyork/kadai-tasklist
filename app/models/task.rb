class Task < ApplicationRecord
    validates :status, presence: true, length: { maximum: 10 }
end
