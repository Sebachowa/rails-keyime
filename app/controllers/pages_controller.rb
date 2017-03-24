class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @skills = Skill.all
  end

  def dashboard
  end
end
