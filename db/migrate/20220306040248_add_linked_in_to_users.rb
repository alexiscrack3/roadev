class AddLinkedInToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :linked_in, :string, null: true
  end
end
