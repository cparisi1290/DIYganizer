class Project < ApplicationRecord
    validates_presence_of :name, :status, :est_date_to_complete
    belongs_to :user
    belongs_to :room
    has_many :builders
    has_many :tools, through: :builders
    accepts_nested_attributes_for :tools, reject_if: proc { |attributes| attributes['name'].blank? }

    scope :filter_by_user_id, -> (user_id) { where("user_id = ?", user_id) }
    scope :filter_by_goal_date, -> (projects) {order(est_date_to_complete: :asc)}


    # accepts_nested_attributes_for :room

    # def tool_attributes=(hash_of_attributes)
    #     if !hash_of_attributes[:name].blank?
    #        self.tool = Tool.find_or_create_by(hash_of_attributes)
    #     end
    # end

    def room_attributes=(hash_of_attributes)
        if !hash_of_attributes[:name].blank?
           self.room = Room.find_or_create_by(hash_of_attributes)
        end
    end

    def due_date_goal
        self.est_date_to_complete.strftime("%a, %b %d %Y")
    end

    # def self.order_by_project_due_date
    #     order(est_date_to_complete: :asc)
    # end

end
