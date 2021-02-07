class Account < ApplicationRecord
    has_many :items, dependent: :destroy

    validates :username, presence: true
    validates :level, presence: true
end
