class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :phone

      t.timestamps
    end
  end
end
