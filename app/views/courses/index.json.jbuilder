json.array!(@courses) do |course|
  json.extract! course, :id, :number, :title
  json.url course_url(course, format: :json)
end
