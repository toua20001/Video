class RenameForeignkey < ActiveRecord::Migration[5.2]
  def change
    rename_column :vs002s, :vs001s_id, :vs001_id
    rename_column :vs003s, :vs001s_id, :vs001_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
