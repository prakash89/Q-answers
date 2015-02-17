class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  def index
  @categories = [
    {
      image: 'ruby.jpeg', 
      category: 'ruby',
    },
    {
      image: 'rails.jpg',
      category: 'rails',
    },
    {
      image: 'html_css.jpg',
      category: 'html&css',
    },
    {
      image: 'jquery.jpeg',
      category: 'javascript&jquery',
    },
    {
      image: 'devops.jpg',
      category: 'devops',
    },
    {
      image: 'testing.jpg',
      category: 'testing',
    }
  ]
  end

  def show
    @category = params[:id]
    @questions = Question.search(params[:search])
  end

end
