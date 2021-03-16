class CreateProjectTools < ActiveRecord::Migration[6.1]
  def change
    create_table :project_tools do |t|
      t.integer :project_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
