Sequel.migration do
  change do
    create_table(:user_sessions) do
      primary_key :id, type: :Bignum

      column :uuid, :uuid, null: false
      column :created_at, "timestamp(6) without time zone", null: false
      column :updated_at, "timestamp(6) without time zone", null: false

      alter_table(:albums){add_foreign_key :user_id, :users}

      index [:uuid], name: :index_user_sessions_on_uuid
    end
  end
end