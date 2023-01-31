class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: "https://cdn.pixabay.com/photo/2017/01/10/03/54/avatar-1968236_960_720.png"
      t.text :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
