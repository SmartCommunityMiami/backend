class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :auth_token, allow_nil: true
  validates :username, presence: true, uniqueness: true

  has_many :reports
  has_many :votes

  def generate_authentication_token!
  	begin
  	  self.auth_token = Devise.friendly_token
  	end while self.class.exists?(auth_token: auth_token)
  end

end
