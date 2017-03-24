class BookingsController < ApplicationController

  def create
    skill = Skill.find(params[:skill_id])
    booking_params = params.require(:booking).permit(:start_time, :end_time)
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.user_id = current_user.id
    @booking.skill_id = skill.id

    if @booking.save
      redirect_to dashboard_path
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
    if @booking.update(booking_params)
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end



end
