class CreatePersonals < ActiveRecord::Migration[7.0]
  def change
    create_table :personals do |t|
      t.string :name
      t.string :doc_type
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
