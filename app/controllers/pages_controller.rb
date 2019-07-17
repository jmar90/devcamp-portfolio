class PagesController < ApplicationController
  def home
    # Pull all blog posts from Blog model & save in @posts instance var
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end
