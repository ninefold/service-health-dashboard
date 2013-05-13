class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :service
      t.references :status
      t.text :message
      t.datetime :start
      t.boolean :informational
      t.references :event_type
      t.boolean :invisible
      t.references :incident
      t.text :description

      t.timestamps
    end
    add_index :events, :service_id
    add_index :events, :status_id
    add_index :events, :event_type_id
    add_index :events, :incident_id
  end
end
