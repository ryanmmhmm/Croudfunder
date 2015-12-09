class AddCatagoriesToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :catagory, :string
  end
end
