class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :tipo
      t.string :valor
      t.references :friend, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
