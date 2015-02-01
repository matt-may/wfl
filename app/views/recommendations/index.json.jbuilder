json.array!(@recommendations) do |recommendation|
  json.extract! recommendation, :id, :date, :restaurant_id, :user_id
  json.url recommendation_url(recommendation, format: :json)
end
