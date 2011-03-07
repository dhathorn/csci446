authorization do 
  role :guest do
    has_permission_on :games, :to => :read
    has_permission_on :users, :to => [:new, :create]
  end

  role :member do
    includes :guest
    has_permission_on :members_games, :to => :all
    has_permission_on :members_members, :to => :all
    has_permission_on :members_users, :to => :read
    has_permission_on :members_users, :to => :all
  end

  role :admin do
    includes :member
    has_permission_on :admin_games, :to => :all
    has_permission_on :admin_admin, :to => :all
    has_permission_on :admin_users, :to => :all
  end

end

privileges do
  privilege :all, :includes => [:new, :read, :edit, :destroy, :create, :update]
  privilege :read, :includes => [:index, :show]
end
