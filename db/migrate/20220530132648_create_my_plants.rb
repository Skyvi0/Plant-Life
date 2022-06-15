class CreateMyPlants < ActiveRecord::Migration[6.1]
  def change
    create_table :my_plants do |t|
      t.string :nickname
      t.string :light_exposure
      t.references :garden, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
