class Question < ApplicationRecord
  has_many :responses, class_name: "Question", foreign_key: "response_id"
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
