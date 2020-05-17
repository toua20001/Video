class AddVideotimeColumnToVs002 < ActiveRecord::Migration[5.2]
  def change
    # 動画の再生時間の列を追加
    add_column :vs002s, :play_time, :string
  end
end
