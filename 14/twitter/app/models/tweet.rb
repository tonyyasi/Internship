class Tweet < ActiveRecord::Base

  validates :content, presence: {message: "No la cague herma"},
                      length: {in: 1..140}
  belongs_to :user
  default_scope -> {order(created_at: :desc)}

 end
