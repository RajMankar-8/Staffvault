class AddAttributeToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :bio, :string
  end
end
 