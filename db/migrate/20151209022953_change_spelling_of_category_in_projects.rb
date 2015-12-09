class ChangeSpellingOfCategoryInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :catagory, :category
  end
end
