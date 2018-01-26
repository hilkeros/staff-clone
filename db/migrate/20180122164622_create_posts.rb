class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.text :message
      t.boolean :visible
      t.boolean :track_reads

      t.timestamps
    end
  end
end
