json.array!(@videos) do |video|
  json.extract! video, :id, :name, :link, :description, :viewed, :course_id
  json.url video_url(video, format: :json)
end
