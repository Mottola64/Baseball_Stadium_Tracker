class CreateUserStadia < ActiveRecord::Migration
  def change
    create_table :user_stadia do |t|
      t.integer :user_id
      t.integer :stadium_id
  end
end