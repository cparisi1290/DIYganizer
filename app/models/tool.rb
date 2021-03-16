class Tool < ApplicationRecord
    has_many :builders
    has_many :projects, through: :builders 
    validates_presence_of :name
    def room_attributes=(hash_of_attributes)
        if !hash_of_attributes[:name].blank?
           self.room = Room.find_or_create_by(hash_of_attributes)
        end
    end
end
