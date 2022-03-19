class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.boolean :is_delete, null: false, default: 0

      t.timestamps
    end
  end
end
