class CreateStadiums < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name
      t.integer :user_id
      t.string :team
      end
  end
end
