class ChangeColumnTypeActions < ActiveRecord::Migration[6.1]
  def change
    rename_column :actions, :type, :action_type
  end
end
