module ProjectsHelper

    def display_index_header
        if @room
             content_tag(:h1, "#{@room.name.capitalize}  Projects")
        else
             content_tag(:h1, "All Projects")
        end
   end

   def display_new_header
        if @room
            content_tag(:h1, "Create a #{@room.name.capitalize} Project")
        else
            content_tag(:h1, "Create a Project")
        end
    end

    def room_form_field(f)
        if @room
             hidden_field :room_id, value: @room.id
        else
             render partial: "room_fields", locals: { f: f }
        end
    end

    # def new_project
    #     if params[:room_id] && @room = Room.find(params[:room_id])
    #         content_tag(:h3, link_to "Create a New Project", new_room_project_path)
    #     else
    #         content_tag(:h3, link_to "Create a New Project", new_project_path)
    #     end
    # end
end
