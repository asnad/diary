class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum user_type: [:member, :coordinator, :administrator]
  enum status: [:active, :disabled]
  has_one_attached :avatar
  def active_for_authentication?
    super && !self.disabled?
  end
end
