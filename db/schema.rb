Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      primary_key :id
      column :name, "text", :null=>false
      column :email, "text", :null=>false
      column :password_digest, "text", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:email], :name=>:users_email_key, :unique=>true
    end
    
    create_table(:user_sessions) do
      primary_key :id
      column :uuid, "text", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      foreign_key :user_id, :users, :key=>[:id]
      
      index [:uuid], :name=>:index_user_sessions_on_uuid
    end
  end
end
