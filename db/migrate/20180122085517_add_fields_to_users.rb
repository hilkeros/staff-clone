class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_reference :users, :group, foreign_key: true
  end
end
