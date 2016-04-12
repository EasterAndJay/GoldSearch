class SearchController < ApplicationController
  require 'will_paginate/array'

  def index
    if params.length > 2
      params[:course].each do |req, value|
        if value == "true"
          params[req] = true
        end
      end
      params[:name] = params[:name][0]
      @courses = Course.search params[:name], :conditions => params[:course], :star => true
      # puts @courses.class.name
      # @courses = @courses.paginate(:per_page => 10, :page => params[:page])
    end
    respond_to do |format|
      format.html { render 'index'}
      format.js { render :layout => false}
    end
  end

  def submit
    #@courses = Course.where("dept = ?",params[:name].upcase)
    # @courses = Course.find_by_fuzzy_name(params[:name]).paginate(:per_page => 10, :page => params[:page])
    # # respond_to do |format|
    # #   format.js
    # end
  end

end
