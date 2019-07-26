class CreateUserStadia < ActiveRecord::Migration
  def change
    create_table :user_stadia do |t|
      t.integer :stadium_id
  end
end
end
