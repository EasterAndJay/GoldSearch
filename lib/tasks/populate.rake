require 'json'

class String
  def string_between_markers marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

namespace :p do
  task :populate => :environment do
    file = open("courses.txt")
    json = file.read
    obj = JSON.parse(json, :quirks_mode => true)
    obj.each do |dept, courses|
      courses.each do |course|
        newCourse = Course.new
        number = course.string_between_markers("#{dept} ",160.chr("UTF-8")).strip()
        title = course.split("-")[1].gsub(160.chr("UTF-8"), "")
        newCourse.number = number
        newCourse.title = title
        newCourse.dept = dept
        newCourse.year = 2016
        newCourse.quarter = "Spring"
        newCourse.save!
      end
    end
  end
end