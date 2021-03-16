class Project < ApplicationRecord
    belongs_to :room

    accepts_nested_attributes_for :room
end
