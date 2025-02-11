class CreateStudios < ActiveRecord::Migration[7.1]
  def change
    create_table :studios do |t|
      t.string "studio_name"  # creates studio_name column


      t.timestamps
    end
  end
end
