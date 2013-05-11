class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.references :severity
      t.string :image

      t.timestamps
    end
    add_index :statuses, :severity_id
  end
end
