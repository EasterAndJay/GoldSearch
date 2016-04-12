class AddInfoToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :desc, :string
    add_column :courses, :units, :string
    add_column :courses, :grading, :string
    
  end
end
