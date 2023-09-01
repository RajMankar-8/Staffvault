 class RemoveMiddleNameFromWorkers < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :middle_name, :string
  end
end
