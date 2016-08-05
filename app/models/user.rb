class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions_created, class_name: "Question", foreign_key: "creator_id"
  has_and_belongs_to_many :questions_asked, class_name: "Question", join_table: "questions_users"
end
