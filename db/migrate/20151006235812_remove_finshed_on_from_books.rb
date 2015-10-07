class RemoveFinshedOnFromBooks < ActiveRecord::Migration
  def change
   remove_column :books, :finshed_on
  end
end
