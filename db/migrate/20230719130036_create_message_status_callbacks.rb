class CreateMessageStatusCallbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :message_status_callbacks do |t|
      t.references :message_request, null: false, foreign_key: true
      t.string :status
      t.string :message_id

      t.timestamps
    end
  end
end
