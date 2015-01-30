class Answer < ActiveRecord::Base
	validates_presence_of :my_answer, :message => "Answer can't be blank"
	belongs_to :question
end
