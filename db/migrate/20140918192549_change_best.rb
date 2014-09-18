class ChangeBest < ActiveRecord::Migration
  def change
    rename_column :questions, :best, :best_answer_id
  end
end
