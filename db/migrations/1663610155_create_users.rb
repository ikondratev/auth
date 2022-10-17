Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id

      String :name, null: false
      String :email, unique: true, null: false
      String :password_digest, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end