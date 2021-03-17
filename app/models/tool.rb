class Tool < ApplicationRecord
    has_many :builders
    has_many :projects, through: :builders 
    
end
