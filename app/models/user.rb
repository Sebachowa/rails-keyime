class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :skills
  has_many :bookings
  has_many :reviews, through: :skills
  # validates :given_name, presence: true
  # validates :family_name, presence: true

  has_many :requests, through: :skills, source: :bookings

  # def requests
  #   self.skills.map { |skill| skill.bookings }.flatten
  # end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:given_name] = auth["info"]["first_name"]
    user_params[:family_name] = auth["info"]["last_name"]
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h
    if user_params[:email].blank?
      user_params[:email] = "#{Devise.friendly_token[0,20]}-#{auth.uid}@fakebook.com"
    end

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      p user
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
  # this sends welcome spam
  # after_create :send_welcome_email
  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
