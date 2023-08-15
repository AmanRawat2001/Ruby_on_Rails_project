class CreateCrms < ActiveRecord::Migration[7.0]
  def change
    create_table :crms do |t|
      t.string :app_name
      t.string :app_phone
      t.string :app_email

      t.timestamps
    end
  end
end
