class AddPKtovs002s < ActiveRecord::Migration[5.2]
  # update
  def up
    change_column :vs002s, :vs001s_id, :bigint, null: false
  end

  # for rollback
  def down 
    change_column :vs002s, :vs001s_id, :bigint, null: true
  end
end
