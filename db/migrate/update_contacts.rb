class UpdateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string :type_contact
      t.string :value
      t.references :friend, index: true, foreign_key: true
 
      t.timestamps
    end
  end
 
  def down
    drop_table :contacts
  end
end
