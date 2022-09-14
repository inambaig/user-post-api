json.title @post.title
json.body @post.body
json.user do
    json.partial! "api/v1/users/user", user: @post.user
end

json.created_at @post.created_at
json.updated_at @post.updated_at
