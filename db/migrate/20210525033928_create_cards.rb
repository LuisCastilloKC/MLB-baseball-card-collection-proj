class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :player_name
      t.string :team_name
      t.integer :year
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :description, null: false, foreign_key: true

      t.timestamps
    end
  end
end
