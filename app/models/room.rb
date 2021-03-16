class Room < ApplicationRecord
    has_many :projects

    accepts_nested_attributes_for :projects, reject_if: proc { |attributes| attributes['name'].blank? || attributes['status'].blank? || attributes['est_date_to_complete'].blank? || attributes['notes'].blank? }
    

end
