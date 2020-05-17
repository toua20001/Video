class CreateVs003s < ActiveRecord::Migration[5.2]
  def change
    create_table :vs003s do |t|
      t.references :vs001s, foreign_key: true
      t.string :tag

      t.timestamps
    end
  end
end
