class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :issue, index: true, foreign_key: true
      t.references :user,  index: true, foreign_key: true

      t.string :description,  null: false, default: ""
      t.string :picture_link, null: false, default: ""
      t.float :latitude,      null: false
      t.float :longitude,     null: false

      t.date :date_resolved

      t.timestamps
    end
  end
end
