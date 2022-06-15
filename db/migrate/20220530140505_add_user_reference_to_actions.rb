class AddUserReferenceToActions < ActiveRecord::Migration[6.1]
  def change
    add_reference :actions, :user, null: false, foreign_key: true
  end
end
