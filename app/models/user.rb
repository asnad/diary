class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum user_type: [:teacher, :guardian, :administrator]
  enum status: [:active, :disabled]
  validates :first_name, :last_name, presence: true
  has_one_attached :avatar
  def active_for_authentication?
    super && !self.disabled?
  end
end
