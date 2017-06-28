class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :omniauthable, omniauth_providers: [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :meals #Meals that the user offers
  has_many :received_orders, class_name: "Order" #The user receive an order
  has_many :prepared_orders, through: :meals, class_name: "Order" #The user has prepared the order
  has_many :placed_orders, through: :received_orders, class_name: "Meal", source: :meal #The user order a meal
  has_many :reviews, through: :meals
  has_many :notifications


  has_attachment :avatar


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end

  def signed_without_oauth?
    provider != "facebook"
  end

  def completed_profile?
   if first_name.present? && last_name.present? && nickname.present?
     true
   else
    false
   end
  end

  def received_reviews
    reviews = []
    meals.each do |meal|
     meal.reviews.each do |review|
      reviews << review
    end
   end
    reviews.size
  end

  def rating_average
    sum = 0
    meals.each do |meal|
      meal.reviews.each do |review|
        sum += review.rating.to_i
      end
    end
    average = sum / reviews.count
    return average
  end

  def full_name
    self.first_name + " " + self.last_name
  end

end
