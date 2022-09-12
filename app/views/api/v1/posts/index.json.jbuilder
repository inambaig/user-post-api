json.array! @posts do |post|
    json.title @posts.title
    json.body @posts.body
    json.user_id @posts.user_id
    json.created_at @posts.created_at
    json.updated_at @posts.updated_at
end