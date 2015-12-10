class AddingPledgeColumnInformation < ActiveRecord::Migration
  def change
    add_reference :pledges, :user, index: true
    add_foreign_key :pledges, :users

    add_reference :pledges, :reward, index: true
    add_foreign_key :pledges, :rewards
  end
end
