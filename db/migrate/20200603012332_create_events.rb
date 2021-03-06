class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.datetime :start
      t.datetime :end
      t.string :color
      t.boolean :allday
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
