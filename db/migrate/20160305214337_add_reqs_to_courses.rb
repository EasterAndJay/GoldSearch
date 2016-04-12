class AddReqsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :area, :string
    add_column :courses, :ethn, :boolean
    add_column :courses, :euro, :boolean
    add_column :courses, :quant, :boolean
    add_column :courses, :world, :boolean
    add_column :courses, :writ, :boolean
  end
end
