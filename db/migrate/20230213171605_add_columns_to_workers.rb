 class AddColumnsToWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :date_of_birth, :date
    add_column :workers, :job_title, :string
  end
end
