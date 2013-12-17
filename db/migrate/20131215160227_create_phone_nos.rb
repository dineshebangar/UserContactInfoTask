class CreatePhoneNos < ActiveRecord::Migration
  def change
    create_table :phone_nos do |t|
      t.integer :mob
      t.integer :contact_id

      t.timestamps
    end
  end
end
