class CreateCartPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_players do |t|
      t.integer :user_id, null: false
      t.integer :post_player_id, null: false
      t.timestamps
    end
  end
end
