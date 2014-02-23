class AssignGroupToPeople < ActiveRecord::Migration
  def change
    change_table :people do |t|
        t.belongs_to :group
    end
  end
end
