class AddBestAnswer < ActiveRecord::Migration
  def change
    add_column :questions, :best, :integer
  end
end
