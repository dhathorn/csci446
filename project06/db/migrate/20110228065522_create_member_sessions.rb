class CreateMemberSessions < ActiveRecord::Migration
  def self.up
    create_table :member_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :member_sessions
  end
end
