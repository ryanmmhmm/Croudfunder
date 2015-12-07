class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :title
      t.text :description
      t.integer :amount

      t.timestamps null: false
    end
  end
end
