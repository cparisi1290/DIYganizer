class Project < ApplicationRecord
    belongs_to :room

    # accepts_nested_attributes_for :room

    def room_attributes=(hash_of_attributes)
        if !hash_of_attributes[:name].blank?
           self.room = Room.find_or_create_by(hash_of_attributes)
        end
    end

    def room_name
        "#{self.room.try(:name)}"
    end 

end
