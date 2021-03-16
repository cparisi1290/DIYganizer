class Project < ApplicationRecord
    belongs_to :room

    # accepts_nested_attributes_for :room

    def room_attributes=(hash_of_attributes)
        if !hash_of_attributes[:name].blank?
           self.room = Room.find_or_create_by(hash_of_attributes)
        end
    end

    def due_date_goal
        self.est_date_to_complete.strftime("%a, %b %d %Y")
    end



end
