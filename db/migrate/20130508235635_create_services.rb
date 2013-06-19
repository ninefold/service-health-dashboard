class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.references :dependent
      t.integer :version
      t.boolean :invisible
      t.integer :order

      t.timestamps
    end
    add_index :services, :slug, unique: true
    add_index :services, :dependent_id
    
  end
end
