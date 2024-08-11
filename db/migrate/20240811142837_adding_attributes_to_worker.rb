class AddingAttributesToWorker < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :about, :string
    add_reference :workers, :job_category, foreign_key: true
  end
end
