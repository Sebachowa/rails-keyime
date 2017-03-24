class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @skills = Skill.all.where.not(latitude: nil)
    @category = params[:search]
    if @category
      @skills = @skills.where(category: @category)
    end
    @coordinates = Gmaps4rails.build_markers(@skills) do |skill, marker|
      marker.lat skill.latitude
      marker.lng skill.longitude
      marker.infowindow skill.name
    end
  end

  def show
    @skill = Skill.find(params[:id])
    @booking = Booking.new
    #   @coordinates = Gmaps4rails.build_markers(@skill.where.not(latitude: nil)) do |skill, marker|

    #   marker.lat skill.latitude
    #   marker.lng skill.longitude
    #   marker.infowindow skill.name
    # end

    @coordinates = [{ lat: @skill.latitude, lng: @skill.longitude }]
  end

  def new
    @skill = Skill.new
  end

  def create
    skill_params = params.require(:skill).permit(:name, :price, :location, :category, :description, photos: [])
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id
    if @skill.save
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    skill_params = params.require(:skill).permit(:name, :price, :location, :category, :description, photos: [])
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    redirect_to skill_path(@skill)
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to dashboard_path
  end
end
