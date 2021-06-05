class DropDescriptions < ActiveRecord::Migration[6.1]
  def change
    drop_table :descriptions
  end
end
