class CreateBackers < ActiveRecord::Migration
  def change
    create_table :backers do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :password

      t.timestamps null: false
    end
  end
end
