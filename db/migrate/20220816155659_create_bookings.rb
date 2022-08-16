class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.string :animal_name
      t.string :animal_type
      t.integer :requested_hours
      t.date :service_date

      t.timestamps
    end
  end
end
