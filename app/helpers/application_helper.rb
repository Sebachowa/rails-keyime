module ApplicationHelper

  def badge_class(booking)
    if booking.status == "rejected"
      "badge-rejected"
    elsif booking.status == "accepted"
      "badge-accepted"
    else
      "badge-pending"
    end
  end
end
