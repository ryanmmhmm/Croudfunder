class DroppingTablesBackersPledge < ActiveRecord::Migration
  def change
    drop_table :pledges
    drop_table :backers
  end
end
