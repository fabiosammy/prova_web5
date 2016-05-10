class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.date :birthday
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
