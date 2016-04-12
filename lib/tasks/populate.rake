require 'json'

class String
  def string_between_markers marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

namespace :p do
  task :populate => :environment do
    file = open("text/courses.txt")
    json = file.read
    obj = JSON.parse(json, :quirks_mode => true)
    obj.each do |dept, courses|
      courses.each do |course|
        newCourse = Course.new
        puts course
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

  task :ge => :environment do
    files = {
      :b => "areaB.txt",
      :c => "areaC.txt",
      :d => "areaD.txt",
      :e => "areaE.txt",
      :f => "areaF.txt",
      :g => "areaG.txt",
      :h => "areaH.txt",
      :ethn => "ethnicitycourses.txt",
      :euro => "eurtradcourses.txt",
      :quant => "quantcourses.txt",
      :world => "worldculturescourses.txt",
      :writ => "writingreqcourses.txt"
    }
    files.each do |req, file_name|
      file = open("text/#{file_name}")
      lines = file.read
      lines.each_line do |course|
        course_dept = course.split(/\s+[0-9]/)[0]
        course_number = course.string_between_markers("#{course_dept} ", " -")
        
        puts course_dept
        puts course_number

        db_course = Course.where(:dept => course_dept, :number => course_number).to_a
        db_course = db_course[0]
        if db_course == nil
          # db_course = Course.create(
          #   :dept => course_dept,
          #   :number => course_number,
          #   :title => course,
          #   :year => "2016",
          #   :quarter => "n/a"
          # )
          next
        end
        if file_name.include?("area")
          db_course.send("area=", req)
          puts db_course.area
        else
          db_course.send("#{req}=", true)
          puts db_course.send("#{req}")
        end
        db_course.save
      end
    end
  end

  task :details => :environment do
    file = open("text/details.txt")
    json = file.read
    obj = JSON.parse(json, :quirks_mode => true)
    obj.each do |key, listOfDepts|
      listOfDepts.each do |depts|
        depts.each do |dept, courses|
          puts dept
          courses.each do |course, info|
            num = course.split("#{dept} ")[1]
            puts num
            if num == nil
              next
            end
            newCourse = Course.new(
              :dept => dept,
              :number => num,
              :year => "2016",
              :quarter => "Spring"
            )
            info.each do |k, v|
              if k == "description"
                k = "desc"
              end
              newCourse.send("#{k}=", v)
            end
            newCourse.save!
          end
        end
      end
    end
  end

end