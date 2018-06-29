class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum user_type: [:member, :coordinator, :administrator]
  enum status: [:active, :banned]

  def active_for_authentication?
    super && !self.banned?
  end
end
