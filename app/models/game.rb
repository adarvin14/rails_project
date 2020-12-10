class Game < ApplicationRecord
    belongs_to :category
    belongs_to :user

    scope :multiplayergames, -> { where("online_multiplayer = true") }

    #scope :awesomegames, -> { where("hours_played > 100") }
    #<%= link_to 'Awesome Games', '/games/search_term/hours_played', class: "btn btn-secondary btn-sm text-white" %>

    validates :title, presence: true

    accepts_nested_attributes_for :category, reject_if: :all_blank
end