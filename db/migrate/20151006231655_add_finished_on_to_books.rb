class AddFinishedOnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :finshed_on, :date
  end
end
