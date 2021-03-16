class CreateBuilders < ActiveRecord::Migration[6.1]
  def change
    create_table :builders do |t|
      t.integer :project_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
