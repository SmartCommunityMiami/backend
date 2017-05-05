class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :report, index: true, foreign_key: true
      t.references :user,   index: true, foreign_key: true
      t.integer :direction, null: false

      t.timestamps
    end
  end
end
