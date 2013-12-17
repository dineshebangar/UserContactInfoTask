class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :description
      t.date :dob
      t.integer :user_id

      t.timestamps
    end
  end
end
