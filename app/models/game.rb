class Game < ApplicationRecord
    has_many :tournaments
    has_many :users, through: :tournamnets
end