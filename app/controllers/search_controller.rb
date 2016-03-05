class SearchController < ApplicationController

  def index
    @courses = nil
  end

  def submit
    #@courses = Course.where("dept = ?",params[:name].upcase)
    @courses = Course.find_by_fuzzy_name(params[:name], :limit => 10)
    render 'index'
  end

end
