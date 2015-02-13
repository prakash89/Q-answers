class Question < ActiveRecord::Base
  acts_as_votable
	validates_presence_of :title, :message => "Title can't be blank"
	validates_presence_of :description, :message => "Description can't be blank"

	has_many :answers
	belongs_to :user

  def self.search(search)
    if search
      where("title like ?" ,"%#{search}%")
    else
      all
    end
  end
end
