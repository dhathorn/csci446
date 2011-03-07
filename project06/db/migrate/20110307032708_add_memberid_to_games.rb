class AddMemberidToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :member_id, :integer
  end

  def self.down
    remove_column :games, :member_id, :integer
  end
end
