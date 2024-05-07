class CreatePostPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :post_players do |t|
      t.integer :user_id, null: false
      t.integer :nationality_id, null: false
      t.string :name, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
