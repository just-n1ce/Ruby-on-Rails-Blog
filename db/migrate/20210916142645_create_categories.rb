# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ''
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
