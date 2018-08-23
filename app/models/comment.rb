class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def username
    self.user.username
  end

end
