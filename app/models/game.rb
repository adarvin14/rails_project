class Game < ApplicationRecord
    belongs_to :category
    belongs_to :user

    scope :online_multiplayer, -> { where("online_multiplayer" > true) }

    validates :title, presence: true

    accepts_nested_attributes_for :category, reject_if: :all_blank
end