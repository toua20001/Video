class CreateFileManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :file_managers do |t|

      t.timestamps
    end
  end
end
