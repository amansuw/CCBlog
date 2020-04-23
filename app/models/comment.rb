class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, foreign_key: :user_id

  def self.create_comment user_id, post_id, comment_param
    comment = self.new
    comment.user_id = user_id
    comment.post_id = post_id
    comment.body = comment_param[:body]
    comment.save
  end

  def commenter
    self.user.email.split('@')[0].capitalize
  end
end
