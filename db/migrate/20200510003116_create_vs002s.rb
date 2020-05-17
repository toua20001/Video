class CreateVs002s < ActiveRecord::Migration[5.2]
  def change
    create_table :vs002s do |t|
      t.references :vs001s, foreign_key: true, null: false
      #Ex:- :null => false
      t.string :title
      t.string :description
      t.string :path

      t.timestamps
    end
  end
end
