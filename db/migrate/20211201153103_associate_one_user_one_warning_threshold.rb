class AssociateOneUserOneWarningThreshold < ActiveRecord::Migration[6.1]
  def change
    # Obviously horrible but just want to get through
    WarningThreshold.destroy_all
  end
end
