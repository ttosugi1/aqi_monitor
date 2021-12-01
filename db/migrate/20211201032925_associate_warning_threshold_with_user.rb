class AssociateWarningThresholdWithUser < ActiveRecord::Migration[6.1]
  def change
    add_reference(:warning_thresholds, :user, index: false)
  end
end
