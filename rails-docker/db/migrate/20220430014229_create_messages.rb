class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer "chat_id"
      t.integer "message_number"
      t.text "message_body"
      t.timestamps
    end
  end
end
