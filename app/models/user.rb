class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :welcome_send
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :reviews, dependent: :destroy

  def active_for_authentication?
    super && !deactivated
  end
  
  def welcome_send
    HardWorker.perform_async(self.id)
  end
end
