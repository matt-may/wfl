json.array!(@ratings) do |rating|
  json.extract! rating, :id, :rate, :user_id, :restaurant_id
  json.url rating_url(rating, format: :json)
end
