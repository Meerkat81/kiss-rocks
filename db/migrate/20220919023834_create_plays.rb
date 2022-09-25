class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.integer :title_id, null: false
      t.integer :artist_id, null:false
      t.integer :kiss_id, uniqueness: true, null: false
      t.integer :kiss_time_stamp, uniqueness:true, null: false
      t.timestamps
    end
    add_foreign_key :plays, :artists
    add_foreign_key :plays, :titles
  end
end
