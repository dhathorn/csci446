Role.create([{:name => "Member"}, {:name => "Admin"}])
User.create({:username => "administrator", :first_name => "Admin", :last_name => "Istrator", :email => 'root@mines.edu', :password => "password", :password_confirmation => "password", :role => Role.find_by_name('Admin')})
User.create({:username => "member", :first_name => "Kitty", :last_name => "Hawk", :email => 'dhssthorn@mines.edu', :password => "password", :password_confirmation => "password", :role => Role.find_by_name('Member')})
(0..10).each do
  Game.create({:title => "Bridge", :rating => 3, :user_id => User.find_by_username("administrator")})
end
