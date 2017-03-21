class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def create
    skill_params = params.require(:skill).permit(:name, :price, :location, :category, :description)
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id

    if @skill.save
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
