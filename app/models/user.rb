class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks

  validates :last_name, presence: true
  validates :first_name, presence: true

  def name
    [first_name, last_name].join(' ')
  end
end
