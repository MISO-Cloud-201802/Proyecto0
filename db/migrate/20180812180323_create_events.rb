class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :category_id
      t.string :place
      t.boolean :is_virtual

      t.timestamps
    end
  end
end
