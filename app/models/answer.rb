class Answer < ActiveRecord::Base
  acts_as_votable
	validates_presence_of :my_answer, :message => "Answer can't be blank"
	belongs_to :question
	belongs_to :user
  has_many :comments
end
