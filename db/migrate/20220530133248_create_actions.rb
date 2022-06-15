class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.references :my_plant, null: false, foreign_key: true
      t.integer :frequency
      t.date :date
      t.string :type

      t.timestamps
    end
  end
end
