class Category < ApplicationRecord
    has_many :games
    has_many :users, through: :movies
    validates :name, presence: true
end