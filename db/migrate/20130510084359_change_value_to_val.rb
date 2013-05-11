class ChangeValueToVal < ActiveRecord::Migration
  def up
  	rename_column :severities, :value, :val
  end

  def down
  	 rename_column :severities, :val, :value
  end
end
