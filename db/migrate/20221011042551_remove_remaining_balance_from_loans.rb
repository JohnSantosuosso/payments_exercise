class RemoveRemainingBalanceFromLoans < ActiveRecord::Migration[5.2]
  def change
    remove_column :loans, :remaining_balance, :decimal
  end
end
