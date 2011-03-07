class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :role_id

      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      
      t.integer   :login_count,         :null => false, :default => 0 
      t.integer   :failed_login_count,  :null => false, :default => 0 
      t.datetime  :last_request_at                                    
      t.datetime  :current_login_at                                   
      t.datetime  :last_login_at                                      
      t.string    :current_login_ip                                   
      t.string    :last_login_ip                                      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
