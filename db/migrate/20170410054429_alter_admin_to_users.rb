class AlterAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :admmin, :admin
  end
end
