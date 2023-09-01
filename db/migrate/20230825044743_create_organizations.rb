class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :about
      
      t.timestamps
    end

    add_reference :organizations, :user, null: false, foreign_key: true
  end
end
