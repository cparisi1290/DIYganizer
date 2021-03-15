class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.datetime :est_date_to_complete
      t.text :notes
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
