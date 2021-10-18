class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :requester, null: false
      t.references :addressee, null: false

      t.timestamps
    end

    # Add these two lines
    add_foreign_key :friendships, :users, column: :requester_id
    add_foreign_key :friendships, :users, column: :addressee_id

  end
end
