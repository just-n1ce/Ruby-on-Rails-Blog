# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :username, null: false, default: ''
      t.text :content, null: false, default: ''
      t.string :avatar
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
