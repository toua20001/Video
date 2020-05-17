class CreateVs001s < ActiveRecord::Migration[5.2]
  def change
    create_table :vs001s do |t|
      t.integer :favorite

      t.timestamps
    end
  end
end
