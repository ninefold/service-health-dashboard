class CreateSeverities < ActiveRecord::Migration
  def change
    create_table :severities do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
