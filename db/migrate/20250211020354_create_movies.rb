class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string "title"
      t.integer "year"  
      t.string "rating" 
      t.references "studio", foreign_key: true  # Automatically creates "studio_id"

      t.timestamps
    end
  end
end
