json.posts @post.each do |post|
  json.title post.title
  json.body post.body
  json.comment post.comments.each do |comment|
    json.commenter comment.commenter
    json.comment_body comment.body
  end
end