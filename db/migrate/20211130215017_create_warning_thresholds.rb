class CreateWarningThresholds < ActiveRecord::Migration[6.1]
  def change
    create_table :warning_thresholds do |t|
      t.string :city
      t.float :threshold

      t.timestamps
    end
  end
end
