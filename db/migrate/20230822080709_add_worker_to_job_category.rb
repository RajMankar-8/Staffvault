class AddWorkerToJobCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :job_categories, :name, :string
    add_reference :workers, :job_category, null: false, foreign_key: true
  end
end
