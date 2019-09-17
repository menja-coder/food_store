class Client < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send
  def welcome_send
    ClientMailer.welcome_email(self).deliver_now
  end
   has_one_attached :avatar
  has_many :reservations
  has_many :commands
  has_many :restaurants, through: :reservations
end

