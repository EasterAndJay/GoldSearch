class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :enroll_code
      t.string :day
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
