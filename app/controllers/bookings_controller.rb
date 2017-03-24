class BookingsController < ApplicationController

  def create
    skill = Skill.find(params[:skill_id])
    booking_params = params.require(:booking).permit(:start_time, :end_time)
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.user_id = current_user.id
    @booking.skill_id = skill.id

    if @booking.save
      redirect_to dashboard_path(current_tab: "bookings")
    else
      render skills_path
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    booking_params = params.require(:booking).permit(:start_time, :end_time, :status)
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_path(current_tab: "requests")
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end



end
