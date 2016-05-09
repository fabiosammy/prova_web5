class ChangeColumnsNames < ActiveRecord::Migration
  def change
    rename_column :contacts, :type, :tipo
    rename_column :contacts, :value, :valor
  end
end
