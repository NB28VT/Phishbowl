class TurnOffNullFalsePrediction < ActiveRecord::Migration
  def change
    change_column :predictions, :user_id, :integer, null: true
  end
end
