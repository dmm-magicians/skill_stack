class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name, null: false, default: ""
      t.text :image, default: ""

      t.timestamps
    end
  end
end
