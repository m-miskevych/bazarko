class AddUserToItems < ActiveRecord::Migration[7.2]
  def change
    # Step 1: Add the user_id column without the NOT NULL constraint
    add_reference :items, :user, foreign_key: true

    # Step 2: Backfill the user_id with the first user's ID
    reversible do |dir|
      dir.up do
        user = User.first
        raise ActiveRecord::MigrationError, "No User record found for backfilling." unless user

        # Update existing items with user_id set to the first user
        Item.where(user_id: nil).update_all(user_id: user.id)

        # Step 3: Add the NOT NULL constraint after data is backfilled
        change_column_null :items, :user_id, false
      end
    end
  end
end
