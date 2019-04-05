class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects_users 
  has_many :projects, through: :projects_users
  has_many :todos

  scope :admin, (lambda do
    where(admin: true)
  end)

  scope :developers, (lambda do
    where(admin: false)
  end)

  def full_name
    "#{first_name} #{last_name}"
  end
end
