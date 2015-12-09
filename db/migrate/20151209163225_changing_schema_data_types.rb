class ChangingSchemaDataTypes < ActiveRecord::Migration
  def change
    change_column :projects, :title, :string
    change_column :projects, :picture_url, :string
    change_column :rewards, :title, :string
  end
end
