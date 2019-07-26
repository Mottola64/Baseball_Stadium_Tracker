class CreateStadiums < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name
      t.string :team
      t.integer :user_id
    end
  end
end
