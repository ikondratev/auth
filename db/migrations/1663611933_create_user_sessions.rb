Sequel.migration do
  change do
    create_table(:user_sessions) do
      primary_key :id

      String :uuid, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false

      foreign_key :user_id, :users

      index [:uuid], name: :index_user_sessions_on_uuid
    end
  end
end