class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.string :name, uniqueness: true
      t.integer :artist_id, null: false
      t.timestamps
    end
    add_foreign_key :titles, :artists
  end
end
