class Question < ActiveRecord::Base
	validates_presence_of :title, :message => "title can't be blank"
	validates_presence_of :description, :message => "description can't be blank"
end
