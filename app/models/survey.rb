class Survey < ActiveRecord::Base
  attr_accessible :user_id, :survey_url, :survey_info, :first_available_datetime, :last_available_datetime, :location_info, :zipcode

  belongs_to :user
  has_many :survey_movies
  has_many :movies, through: :survey_movies

  before_save :generate_survey_url

  def generate_survey_url
    self.url = SecureRandom.urlsafe_base64
  end
end