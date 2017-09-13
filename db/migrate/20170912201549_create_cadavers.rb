class CreateCadavers < ActiveRecord::Migration[5.1]
  def change
    create_table :cadavers do |t|
      t.belongs_to :user, foreign_key: true
      t.string :first_name, null: false
      t.integer :age, null: false
      t.boolean :fresh, null: false
      t.boolean :healthy, null: false
      t.boolean :whole, null: false
      t.text :description

      t.timestamps
    end
  end
end
