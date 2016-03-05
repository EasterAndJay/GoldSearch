class AddDeptYearQuarterToCourses < ActiveRecord::Migration
  def change
    change_column :courses, :number, :string
    add_column :courses, :dept, :string
    add_column :courses, :year, :int
    add_column :courses, :quarter, :string
  end
end
