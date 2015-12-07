class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :title
      t.integer :funding_goal
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.text :picture_url

      t.timestamps null: false
    end
  end
end
