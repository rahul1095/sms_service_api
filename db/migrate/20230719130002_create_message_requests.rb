class CreateMessageRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :message_requests do |t|
      t.string :phone_number
      t.text :message_body
      t.string :callback_url
      t.string :status

      t.timestamps
    end
  end
end
