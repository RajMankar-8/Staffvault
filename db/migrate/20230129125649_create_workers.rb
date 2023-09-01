class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :address_line1
      t.references :job_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
