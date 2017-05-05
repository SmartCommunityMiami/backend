class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :description, null: false, default: ""
      t.references :department, index: true, foreign_key: true

      t.timestamps
    end
  end
end
