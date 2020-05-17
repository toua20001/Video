class AddColumntoVs002 < ActiveRecord::Migration[5.2]
  def change
    # 動画サムネイル用のパスを追加
    add_column :vs002s, :img_path, :string
  end
end
