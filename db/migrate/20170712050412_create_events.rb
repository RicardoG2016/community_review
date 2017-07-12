class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.integer :category_id
      t.timestamp :time
      t.string :topic
      t.string :address
      t.string :venue_name
      t.string :status
      t.string :event_url
      t.integer :meetup_id
      t.integer :headcount
      t.float :distance
      t.integer :waitlist_count
      t.timestamp :created
      t.integer :mybe_rsvp_count
      t.integer :yes_rsvp_count
      t.timestamp :updated
      t.string :group_name
      t.integer :group_meetup_id
      t.string :group_url

      t.timestamps
    end
  end
end
