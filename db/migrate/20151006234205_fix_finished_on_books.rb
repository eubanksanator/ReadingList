class FixFinishedOnBooks < ActiveRecord::Migration
  def change
     change_table :books do |t|
      t.remove :finshed_on
      t.date :finished_on
     end
  end
end
