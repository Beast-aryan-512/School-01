class CreateSclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :sclasses do |t|
      t.string :class_name
      t.string :subject
      t.string :section
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
